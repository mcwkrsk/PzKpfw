"""Structured coursework assignment input and deterministic safe plan builder."""
from __future__ import annotations

from dataclasses import dataclass

from ..document import ProjectDocument
from ..methodology import (
    CylindricalCalculationError,
    CylindricalGeometryInput,
    calculate_allowable_contact_stress_63,
    calculate_allowable_bending_stress_69,
    calculate_bending_life_factor_610,
    calculate_bending_helix_factor,
    calculate_bending_transverse_factor_619,
    calculate_bending_dynamic_load_621,
    calculate_bending_dynamic_factor_620,
    calculate_bending_specific_load_618,
    calculate_bending_module_68,
    calculate_center_distance_61,
    calculate_contact_dynamic_factor_615,
    calculate_contact_dynamic_load_616,
    calculate_contact_life_factor_64,
    calculate_contact_specific_load_614,
    calculate_equivalent_cycles_65,
    calculate_equivalent_cycles_66,
    calculate_equivalent_bending_cycles_611,
    calculate_forces,
    calculate_geometry,
    calculate_pinion_diameter_62,
    calculate_minimum_bending_module_612,
    bending_design_coefficients,
    combine_allowable_contact_stress_67,
    check_contact_stress_613,
    check_bending_stress_617,
    check_maximum_bending,
    check_maximum_contact,
    calculation_route,
    normalize_symbol,
    parse_engagement,
    parse_contact_life_category,
    parse_load_spectrum,
    parse_tooth_form,
    round_standard_module,
    recommend_topics,
    values_by_symbol,
)
from .models import AssistantPlan, AssistantProtocolError, MAX_SHORT_TEXT, MAX_TEXT


TRANSMISSION_LABELS = {
    "flat_belt": "Плоскоременная передача",
    "v_belt": "Клиноременная передача",
    "toothed_belt": "Передача зубчатым ремнем",
    "chain": "Цепная передача",
    "cylindrical": "Цилиндрическая зубчатая передача",
    "bevel": "Коническая зубчатая передача",
    "worm": "Червячная передача",
}

CALCULATION_LABELS = {
    "design": "Проектировочный расчет",
    "verification": "Проверочный расчет",
    "geometry": "Геометрический расчет",
}

@dataclass(frozen=True)
class AssignmentInput:
    name: str
    symbol: str
    value: str
    unit: str = ""


@dataclass(frozen=True)
class CourseworkAssignment:
    title: str
    transmission_kind: str
    calculation_mode: str
    parent_action_id: str
    inputs: tuple[AssignmentInput, ...]
    notes: str = ""
    perform_calculations: bool = False

    def __post_init__(self) -> None:
        if not self.title.strip() or len(self.title) > MAX_SHORT_TEXT:
            raise AssistantProtocolError(f"assignment title must contain 1–{MAX_SHORT_TEXT} characters")
        if self.transmission_kind not in TRANSMISSION_LABELS:
            raise AssistantProtocolError(f"unsupported transmission kind: {self.transmission_kind!r}")
        if self.calculation_mode not in CALCULATION_LABELS:
            raise AssistantProtocolError(f"unsupported calculation mode: {self.calculation_mode!r}")
        if not self.parent_action_id.strip():
            raise AssistantProtocolError("parent action must be selected")
        if len(self.inputs) > 64:
            raise AssistantProtocolError("assignment contains more than 64 input values")
        if len(self.notes) > MAX_TEXT:
            raise AssistantProtocolError(f"assignment notes exceed {MAX_TEXT} characters")


def parse_assignment_inputs(text: str) -> tuple[AssignmentInput, ...]:
    """Parse symbolic or valued parameters from the friendly form."""
    if not isinstance(text, str):
        raise AssistantProtocolError("input values must be text")
    result: list[AssignmentInput] = []
    for line_number, raw_line in enumerate(text.splitlines(), start=1):
        line = raw_line.strip()
        if not line or line.startswith("#"):
            continue
        parts = [part.strip() for part in line.split("|")]
        if len(parts) not in {3, 4}:
            raise AssistantProtocolError(
                f"input line {line_number}: expected 'name | symbol | value | unit'"
            )
        if len(parts) == 3:
            parts.append("")
        name, symbol, value, unit = parts
        if not name or not symbol:
            raise AssistantProtocolError(
                f"input line {line_number}: name and symbol must not be empty"
            )
        if any(len(item) > MAX_SHORT_TEXT for item in parts):
            raise AssistantProtocolError(f"input line {line_number} contains an overlong value")
        result.append(AssignmentInput(name=name, symbol=symbol, value=value, unit=unit))
    if not result:
        raise AssistantProtocolError("add at least one symbolic parameter")
    return tuple(result)


def build_assignment_plan(document: ProjectDocument, assignment: CourseworkAssignment) -> AssistantPlan:
    """Build a non-calculating scaffold through the same strict protocol."""
    try:
        document.action(assignment.parent_action_id)
    except KeyError as exc:
        raise AssistantProtocolError(
            f"parent action {assignment.parent_action_id!r} does not exist"
        ) from exc

    transmission = TRANSMISSION_LABELS[assignment.transmission_kind]
    mode = CALCULATION_LABELS[assignment.calculation_mode]
    existing_numbers = [
        int(node.get("number", ""))
        for node in document.params_node.findall("param")
        if node.get("group") == "5" and node.get("number", "").isdigit()
    ]
    next_number = max(existing_numbers, default=0) + 1
    operations: list[dict[str, object]] = [
        {
            "operation_id": "assignment-object",
            "type": "add_object",
            "arguments": {"name": transmission},
        },
        {
            "operation_id": "assignment-action",
            "type": "add_action",
            "arguments": {
                "name": f"{mode}: {assignment.title}",
                "action_type": 2,
                "formalization": 2,
                "status": 1,
                "parent_id": assignment.parent_action_id,
            },
        },
    ]
    route = calculation_route(assignment.transmission_kind, assignment.calculation_mode)
    for index, step in enumerate(route):
        operations.append({
            "operation_id": f"calculation-step-{index + 1}",
            "type": "add_action",
            "arguments": {
                "name": step.action_title,
                "action_type": 0,
                "formalization": 2,
                "status": 1,
                "parent_operation_id": "assignment-action",
            },
        })
    manual_checks = []
    for item in assignment.inputs:
        description = f"Параметр схемы: {item.name} ({item.symbol})"
        if item.value:
            description += f" = {item.value}"
        if item.unit:
            description += f" {item.unit}"
        manual_checks.append(description)
    for index, item in enumerate(assignment.inputs):
        operations.append({
            "operation_id": f"assignment-parameter-{index + 1}",
            "type": "add_parameter",
            "arguments": {
                "object_operation_id": "assignment-object",
                "attributes": {
                    "name": item.name,
                    "group": "5",
                    "number": str(next_number + index),
                    "sign": item.symbol,
                    "codingType": "1",
                    "value": item.value,
                    "unit": item.unit,
                },
            },
        })
    derived_parameters: list[tuple[str, str, float, str]] = []
    calculation_notes: list[str] = []
    if assignment.perform_calculations and assignment.transmission_kind == "cylindrical":
        raw_values: dict[str, str] = {}
        engagement_internal: bool | None = None
        life_category: str | None = None
        load_steps = None
        tooth_form: str | None = None
        text_symbols_seen: set[str] = set()
        for item in assignment.inputs:
            raw_symbol = item.symbol.strip()
            normalized_symbol = normalize_symbol(raw_symbol)
            if normalized_symbol in {"engagement", "life_category", "load_steps", "tooth_form"}:
                if normalized_symbol in text_symbols_seen:
                    raise AssistantProtocolError(f"duplicate input symbol {normalized_symbol!r}")
                text_symbols_seen.add(normalized_symbol)
                try:
                    if normalized_symbol == "engagement":
                        engagement_internal = parse_engagement(item.value)
                    elif normalized_symbol == "life_category":
                        life_category = parse_contact_life_category(item.value)
                    elif normalized_symbol == "load_steps":
                        load_steps = parse_load_spectrum(item.value)
                    else:
                        tooth_form = parse_tooth_form(item.value)
                except CylindricalCalculationError as exc:
                    raise AssistantProtocolError(str(exc)) from exc
                continue
            if raw_symbol in raw_values:
                raise AssistantProtocolError(f"duplicate input symbol {raw_symbol!r}")
            raw_values[raw_symbol] = item.value
        try:
            numeric = values_by_symbol(raw_values)
        except CylindricalCalculationError as exc:
            raise AssistantProtocolError(str(exc)) from exc

        effective_nhe = numeric.get("nhe")
        if load_steps is not None and ({"th", "n1"}.issubset(numeric)):
            raise AssistantProtocolError(
                "choose either load_steps for formula (6.6) or th and n1 for formula (6.5)"
            )
        if load_steps is not None:
            if "t1" not in numeric:
                calculation_notes.append("Формула (6.6) не вычислена: добавьте T1")
            else:
                try:
                    cycles_66 = calculate_equivalent_cycles_66(
                        reference_torque_nm=numeric["t1"], steps=load_steps,
                    )
                except CylindricalCalculationError as exc:
                    raise AssistantProtocolError(str(exc)) from exc
                effective_nhe = cycles_66.equivalent_cycles
                derived_parameters.extend((
                    ("Суммарное число циклов циклограммы", "NSigma_66", cycles_66.total_cycles, "цикл"),
                    ("Эквивалентное число циклов по формуле 6.6", "NHE_66", cycles_66.equivalent_cycles, "цикл"),
                ))
                calculation_notes.append(
                    "Формула (6.6), стр. 49: обработана ступенчатая циклограмма нагрузки; "
                    "согласно примечанию методики динамический эффект в KHL не учитывается"
                )
        elif {"th", "n1"}.issubset(numeric):
            try:
                cycles_65 = calculate_equivalent_cycles_65(
                    operating_hours=numeric["th"], speed_rpm=numeric["n1"],
                )
            except CylindricalCalculationError as exc:
                raise AssistantProtocolError(str(exc)) from exc
            effective_nhe = cycles_65
            derived_parameters.append((
                "Эквивалентное число циклов при постоянной нагрузке",
                "NHE_65",
                cycles_65,
                "цикл",
            ))
            calculation_notes.append("Формула (6.5), стр. 49: рассчитано число циклов при постоянной нагрузке")
        elif {"th", "n1"} & set(numeric):
            missing_65 = sorted({"th", "n1"} - set(numeric))
            calculation_notes.append("Формула (6.5) не вычислена: добавьте " + ", ".join(missing_65))

        effective_khl = numeric.get("khl")
        if "nh0" in numeric or effective_nhe is not None or life_category is not None:
            missing_64 = []
            if "nh0" not in numeric:
                missing_64.append("NH0")
            if effective_nhe is None:
                missing_64.append("NHE либо данные формулы (6.5)/(6.6)")
            if life_category is None:
                missing_64.append("life_category")
            if missing_64:
                calculation_notes.append("Формула (6.4) не вычислена: добавьте " + ", ".join(missing_64))
            else:
                try:
                    life_64 = calculate_contact_life_factor_64(
                        base_cycles=numeric["nh0"],
                        equivalent_cycles=effective_nhe,
                        category=life_category,
                    )
                except CylindricalCalculationError as exc:
                    raise AssistantProtocolError(str(exc)) from exc
                effective_khl = life_64.factor
                derived_parameters.append((
                    "Коэффициент долговечности контактной выносливости",
                    "KHL_64",
                    life_64.factor,
                    "-",
                ))
                calculation_notes.append(
                    "Формула (6.4), стр. 48: рассчитан KHL"
                    + (f"; ограничен значением {life_64.maximum_factor:g}" if life_64.capped else "")
                )

        individual_contact_stress = None
        if "sigma_hp_base" in numeric:
            if effective_khl is None:
                calculation_notes.append("Формула (6.3) не вычислена: добавьте KHL или данные формулы (6.4)")
            else:
                try:
                    individual_contact_stress = calculate_allowable_contact_stress_63(
                        base_stress_mpa=numeric["sigma_hp_base"], life_factor=effective_khl,
                    )
                except CylindricalCalculationError as exc:
                    raise AssistantProtocolError(str(exc)) from exc
                derived_parameters.append((
                    "Допускаемое контактное напряжение по формуле 6.3",
                    "sigmaHP_63",
                    individual_contact_stress,
                    "МПа",
                ))
                calculation_notes.append("Формула (6.3), стр. 46: рассчитано допускаемое контактное напряжение")

        pair_contact_stress = None
        formula_67_inputs = {"sigma_hp1", "sigma_hp2"}
        if formula_67_inputs & set(numeric) or tooth_form is not None:
            missing_67 = sorted(formula_67_inputs - set(numeric))
            if tooth_form is None:
                missing_67.append("tooth_form")
            if missing_67:
                calculation_notes.append("Формула (6.7) не вычислена: добавьте " + ", ".join(missing_67))
            else:
                try:
                    pair_67 = combine_allowable_contact_stress_67(
                        stress_1_mpa=numeric["sigma_hp1"],
                        stress_2_mpa=numeric["sigma_hp2"],
                        tooth_form=tooth_form,
                    )
                except CylindricalCalculationError as exc:
                    raise AssistantProtocolError(str(exc)) from exc
                pair_contact_stress = pair_67.allowable_stress_mpa
                derived_parameters.append((
                    "Допускаемое контактное напряжение пары",
                    "sigmaHP_67",
                    pair_contact_stress,
                    "МПа",
                ))
                calculation_notes.append(
                    "Формула (6.7), стр. 50: определено напряжение пары"
                    + ("; ограничено 1,23·sigmaHPmin" if pair_67.limited else "")
                )

        effective_sigma_hp = numeric.get("sigma_hp")
        if effective_sigma_hp is None:
            effective_sigma_hp = pair_contact_stress or individual_contact_stress

        bending_exponent = None
        if "mf" in numeric:
            if not numeric["mf"].is_integer() or int(numeric["mf"]) not in {6, 9}:
                raise AssistantProtocolError("mF must be 6 or 9")
            bending_exponent = int(numeric["mf"])

        effective_nfe = numeric.get("nfe")
        if bending_exponent is not None and load_steps is not None:
            if "t1" not in numeric:
                calculation_notes.append("Формула (6.11) не вычислена: добавьте T1")
            else:
                try:
                    cycles_611 = calculate_equivalent_bending_cycles_611(
                        reference_torque_nm=numeric["t1"],
                        steps=load_steps,
                        exponent=bending_exponent,
                    )
                except CylindricalCalculationError as exc:
                    raise AssistantProtocolError(str(exc)) from exc
                effective_nfe = cycles_611.equivalent_cycles
                derived_parameters.append((
                    "Эквивалентное число циклов изгиба по формуле 6.11",
                    "NFE_611",
                    cycles_611.equivalent_cycles,
                    "цикл",
                ))
                calculation_notes.append("Формула (6.11), стр. 52: обработана циклограмма изгибной нагрузки")
        elif bending_exponent is not None and {"th", "n1"}.issubset(numeric):
            try:
                effective_nfe = calculate_equivalent_cycles_65(
                    operating_hours=numeric["th"], speed_rpm=numeric["n1"],
                )
            except CylindricalCalculationError as exc:
                raise AssistantProtocolError(str(exc)) from exc
            derived_parameters.append((
                "Эквивалентное число циклов изгиба при постоянной нагрузке",
                "NFE_const",
                effective_nfe,
                "цикл",
            ))

        effective_kfl = numeric.get("kfl")
        bending_life_requested = bool({"nf0", "nfe", "mf", "sigma_fp_base"} & set(numeric))
        if bending_life_requested and effective_kfl is None:
            missing_610 = []
            if "nf0" not in numeric:
                missing_610.append("NF0")
            if effective_nfe is None:
                missing_610.append("NFE либо данные постоянной/ступенчатой нагрузки")
            if bending_exponent is None:
                missing_610.append("mF")
            if missing_610:
                calculation_notes.append("Формула (6.10) не вычислена: добавьте " + ", ".join(missing_610))
            else:
                try:
                    life_610 = calculate_bending_life_factor_610(
                        base_cycles=numeric["nf0"],
                        equivalent_cycles=effective_nfe,
                        exponent=bending_exponent,
                    )
                except CylindricalCalculationError as exc:
                    raise AssistantProtocolError(str(exc)) from exc
                effective_kfl = life_610.factor
                derived_parameters.append((
                    "Коэффициент долговечности при изгибе",
                    "KFL_610",
                    life_610.factor,
                    "-",
                ))
                calculation_notes.append(
                    "Формула (6.10), стр. 50: рассчитан KFL"
                    + (f"; ограничен значением {life_610.maximum_factor:g}" if life_610.capped else "")
                )

        allowable_bending_stress = numeric.get("sigma_fp1")
        if "sigma_fp_base" in numeric:
            if effective_kfl is None:
                calculation_notes.append("Формула (6.9) не вычислена: добавьте KFL или данные формулы (6.10)")
            else:
                try:
                    allowable_bending_stress = calculate_allowable_bending_stress_69(
                        base_stress_mpa=numeric["sigma_fp_base"],
                        life_factor=effective_kfl,
                    )
                except CylindricalCalculationError as exc:
                    raise AssistantProtocolError(str(exc)) from exc
                derived_parameters.append((
                    "Допускаемое напряжение изгиба по формуле 6.9",
                    "sigmaFP_69",
                    allowable_bending_stress,
                    "МПа",
                ))
                calculation_notes.append("Формула (6.9), стр. 50: рассчитано допускаемое напряжение изгиба")

        size_61 = None
        size_62 = None
        if assignment.calculation_mode == "design":
            formula_61_required = {"ka", "u", "t1", "khbeta", "psi_ba"}
            if {"ka", "psi_ba"} & set(numeric):
                missing_61 = sorted(formula_61_required - set(numeric))
                if effective_sigma_hp is None:
                    missing_61.append("sigmaHP либо данные формул (6.3)–(6.7)")
                if engagement_internal is None:
                    missing_61.append("engagement")
                if missing_61:
                    calculation_notes.append(
                        "Формула (6.1) не вычислена: добавьте " + ", ".join(missing_61)
                    )
                else:
                    try:
                        size_61 = calculate_center_distance_61(
                            coefficient_ka=numeric["ka"],
                            ratio=numeric["u"],
                            torque_nm=numeric["t1"],
                            load_distribution_factor=numeric["khbeta"],
                            face_width_ratio_ba=numeric["psi_ba"],
                            allowable_contact_stress_mpa=effective_sigma_hp,
                            internal_gearing=engagement_internal,
                        )
                    except CylindricalCalculationError as exc:
                        raise AssistantProtocolError(str(exc)) from exc
                    derived_parameters.append((
                        "Проектировочное межосевое расстояние по формуле 6.1",
                        "aw_61",
                        size_61.center_distance_mm,
                        "мм",
                    ))
                    calculation_notes.append(
                        "Формула (6.1), стр. 44: рассчитано проектировочное межосевое расстояние; "
                        + ("внутреннее" if engagement_internal else "внешнее")
                        + " зацепление"
                    )

            formula_62_required = {"kd", "u", "t1", "khbeta", "psi_bd"}
            if {"kd", "psi_bd"} & set(numeric):
                missing_62 = sorted(formula_62_required - set(numeric))
                if effective_sigma_hp is None:
                    missing_62.append("sigmaHP либо данные формул (6.3)–(6.7)")
                if engagement_internal is None:
                    missing_62.append("engagement")
                if missing_62:
                    calculation_notes.append(
                        "Формула (6.2) не вычислена: добавьте " + ", ".join(missing_62)
                    )
                else:
                    try:
                        size_62 = calculate_pinion_diameter_62(
                            coefficient_kd=numeric["kd"],
                            ratio=numeric["u"],
                            torque_nm=numeric["t1"],
                            load_distribution_factor=numeric["khbeta"],
                            face_width_ratio_bd=numeric["psi_bd"],
                            allowable_contact_stress_mpa=effective_sigma_hp,
                            internal_gearing=engagement_internal,
                        )
                    except CylindricalCalculationError as exc:
                        raise AssistantProtocolError(str(exc)) from exc
                    derived_parameters.append((
                        "Проектировочный диаметр шестерни по формуле 6.2",
                        "dw1_62",
                        size_62.pinion_diameter_mm,
                        "мм",
                    ))
                    calculation_notes.append(
                        "Формула (6.2), стр. 46: рассчитан проектировочный диаметр шестерни; "
                        + ("внутреннее" if engagement_internal else "внешнее")
                        + " зацепление"
                    )

            effective_aw = numeric.get("aw")
            if effective_aw is None and size_61 is not None:
                effective_aw = size_61.center_distance_mm
            effective_kma = numeric.get("kma")
            effective_km = numeric.get("km")
            bending_design_requested = bool(
                {"kma", "km", "yf1", "bw", "kfbeta", "sigma_fp1", "sigma_fp_base"}
                & set(numeric)
            )
            if bending_design_requested and (effective_kma is None or effective_km is None):
                if tooth_form is None:
                    calculation_notes.append(
                        "Коэффициенты Kma и Km не выбраны: добавьте tooth_form или задайте коэффициенты явно"
                    )
                else:
                    try:
                        coefficients = bending_design_coefficients(
                            tooth_form=tooth_form,
                            overlap_ratio=numeric.get("epsilon_beta"),
                        )
                    except CylindricalCalculationError as exc:
                        raise AssistantProtocolError(str(exc)) from exc
                    if effective_kma is None:
                        effective_kma = coefficients.kma
                    if effective_km is None:
                        effective_km = coefficients.km

            calculated_modules: list[float] = []
            formula_68_trigger = bool({"kma", "yf1", "bw"} & set(numeric))
            if formula_68_trigger:
                missing_68 = sorted({"u", "t1", "yf1", "bw"} - set(numeric))
                if effective_kma is None:
                    missing_68.append("Kma или tooth_form")
                if effective_aw is None:
                    missing_68.append("aw либо результат формулы (6.1)")
                if allowable_bending_stress is None:
                    missing_68.append("sigmaFP1 либо данные формул (6.9)–(6.11)")
                if engagement_internal is None:
                    missing_68.append("engagement")
                if missing_68:
                    calculation_notes.append("Формула (6.8) не вычислена: добавьте " + ", ".join(missing_68))
                else:
                    try:
                        module_68 = calculate_bending_module_68(
                            coefficient_kma=effective_kma,
                            torque_nm=numeric["t1"],
                            ratio=numeric["u"],
                            tooth_form_factor=numeric["yf1"],
                            center_distance_mm=effective_aw,
                            face_width_mm=numeric["bw"],
                            allowable_bending_stress_mpa=allowable_bending_stress,
                            internal_gearing=engagement_internal,
                        )
                    except CylindricalCalculationError as exc:
                        raise AssistantProtocolError(str(exc)) from exc
                    calculated_modules.append(module_68)
                    derived_parameters.append(("Расчетный модуль по формуле 6.8", "m_68", module_68, "мм"))
                    calculation_notes.append("Формула (6.8), стр. 50: рассчитан модуль по изгибной выносливости")

            formula_612_trigger = bool({"km", "kfbeta", "yf1"} & set(numeric))
            if formula_612_trigger:
                missing_612 = sorted({"t1", "kfbeta", "yf1", "z1", "psi_bd"} - set(numeric))
                if effective_km is None:
                    missing_612.append("Km или tooth_form")
                if allowable_bending_stress is None:
                    missing_612.append("sigmaFP1 либо данные формул (6.9)–(6.11)")
                if missing_612:
                    calculation_notes.append("Формула (6.12) не вычислена: добавьте " + ", ".join(missing_612))
                else:
                    if not numeric["z1"].is_integer():
                        raise AssistantProtocolError("z1 must be a whole number for formula (6.12)")
                    try:
                        module_612 = calculate_minimum_bending_module_612(
                            coefficient_km=effective_km,
                            torque_nm=numeric["t1"],
                            load_distribution_factor=numeric["kfbeta"],
                            tooth_form_factor=numeric["yf1"],
                            pinion_teeth=int(numeric["z1"]),
                            face_width_ratio_bd=numeric["psi_bd"],
                            allowable_bending_stress_mpa=allowable_bending_stress,
                        )
                    except CylindricalCalculationError as exc:
                        raise AssistantProtocolError(str(exc)) from exc
                    calculated_modules.append(module_612)
                    derived_parameters.append(("Минимальный модуль по формуле 6.12", "m_612", module_612, "мм"))
                    calculation_notes.append("Формула (6.12), стр. 52: рассчитан минимальный модуль упрочнённых зубьев")

            if calculated_modules:
                try:
                    standard_module = round_standard_module(max(calculated_modules))
                except CylindricalCalculationError as exc:
                    raise AssistantProtocolError(str(exc)) from exc
                derived_parameters.append((
                    "Принятый стандартный модуль по таблице 6.8",
                    "m_standard",
                    standard_module,
                    "мм",
                ))
                calculation_notes.append(
                    "Таблица 6.8, стр. 52: больший расчетный модуль округлен вверх по предпочтительному первому ряду"
                )

        geometry = None
        forces = None
        required = {"z1", "z2", "m", "beta", "x1", "x2"}
        missing = sorted(required - set(numeric))
        if missing:
            calculation_notes.append(
                "Автоматический геометрический расчет не выполнен: добавьте явные исходные символы "
                + ", ".join(missing)
            )
        else:
            if not numeric["z1"].is_integer() or not numeric["z2"].is_integer():
                raise AssistantProtocolError("z1 and z2 must be whole numbers")
            try:
                geometry = calculate_geometry(CylindricalGeometryInput(
                    z1=int(numeric["z1"]),
                    z2=int(numeric["z2"]),
                    module_mm=numeric["m"],
                    beta_deg=numeric["beta"],
                    x1=numeric["x1"],
                    x2=numeric["x2"],
                    center_distance_mm=numeric.get("aw"),
                ))
            except CylindricalCalculationError as exc:
                raise AssistantProtocolError(str(exc)) from exc
            derived_parameters.extend((
                ("Расчетное передаточное отношение", "u", geometry.ratio, "-"),
                ("Делительное межосевое расстояние", "a", geometry.pitch_center_distance_mm, "мм"),
                ("Рабочее межосевое расстояние", "aw", geometry.center_distance_mm, "мм"),
                ("Угол профиля в торцовом сечении", "alpha_t", geometry.transverse_pressure_angle_deg, "град"),
                ("Рабочий угол зацепления", "alpha_tw", geometry.working_pressure_angle_deg, "град"),
                ("Суммарный коэффициент смещения", "xSigma", geometry.shift_sum, "-"),
                ("Коэффициент воспринимаемого смещения", "y", geometry.perceived_shift, "-"),
                ("Коэффициент уравнительного смещения", "delta_y", geometry.equalizing_shift, "-"),
                ("Делительный диаметр шестерни", "d1", geometry.pitch_diameter_1_mm, "мм"),
                ("Делительный диаметр колеса", "d2", geometry.pitch_diameter_2_mm, "мм"),
                ("Начальный диаметр шестерни", "dw1", geometry.working_diameter_1_mm, "мм"),
                ("Начальный диаметр колеса", "dw2", geometry.working_diameter_2_mm, "мм"),
                ("Диаметр вершин шестерни", "da1", geometry.tip_diameter_1_mm, "мм"),
                ("Диаметр вершин колеса", "da2", geometry.tip_diameter_2_mm, "мм"),
                ("Диаметр впадин шестерни", "df1", geometry.root_diameter_1_mm, "мм"),
                ("Диаметр впадин колеса", "df2", geometry.root_diameter_2_mm, "мм"),
            ))
            try:
                forces = calculate_forces(
                    geometry,
                    beta_deg=numeric["beta"],
                    torque_nm=numeric.get("t1"),
                    power_kw=numeric.get("power"),
                    speed_rpm=numeric.get("n1"),
                )
            except CylindricalCalculationError as exc:
                if "provide T1" in str(exc):
                    calculation_notes.append(
                        "Силы не рассчитаны: добавьте T1 или пару N и n1"
                    )
                else:
                    raise AssistantProtocolError(str(exc)) from exc
            else:
                derived_parameters.extend((
                    ("Расчетный крутящий момент", "T1_calc", forces.torque_nm, "Н·м"),
                    ("Окружная сила", "Ft", forces.tangential_force_n, "Н"),
                    ("Радиальная сила", "Fr", forces.radial_force_n, "Н"),
                    ("Осевая сила", "Fx", forces.axial_force_n, "Н"),
                ))
            calculation_notes.append(
                "Автоматически рассчитана геометрия по проверенной таблице 6.15"
            )
            if any(item[1] == "Ft" for item in derived_parameters):
                calculation_notes.append(
                    "Автоматически рассчитаны силы по проверенной таблице 6.16"
                )
            calculation_notes.append(
                "Расчет таблицы 6.15 выполнен для цилиндрической передачи внешнего зацепления"
            )

        contact_613 = None
        contact_symbols = {
            "zh", "zm", "zepsilon", "wht", "whv", "whv_limit", "delta_h", "g0",
            "velocity", "khalpha", "khv", "ft", "dw1",
        }
        contact_check_requested = bool(contact_symbols & set(numeric))
        if contact_check_requested:
            effective_aw_613 = numeric.get("aw")
            effective_u_613 = numeric.get("u")
            effective_dw1_613 = numeric.get("dw1")
            effective_ft_614 = numeric.get("ft")
            if geometry is not None:
                effective_aw_613 = effective_aw_613 or geometry.center_distance_mm
                effective_u_613 = effective_u_613 or geometry.ratio
                effective_dw1_613 = effective_dw1_613 or geometry.working_diameter_1_mm
            if forces is not None:
                effective_ft_614 = effective_ft_614 or forces.tangential_force_n

            effective_whv = numeric.get("whv")
            dynamic_load_requested = bool(
                {"delta_h", "g0", "velocity", "whv_limit"} & set(numeric)
            )
            if effective_whv is None and dynamic_load_requested:
                missing_616 = sorted({"delta_h", "g0", "velocity"} - set(numeric))
                if effective_aw_613 is None:
                    missing_616.append("aw либо геометрия")
                if effective_u_613 is None:
                    missing_616.append("u либо геометрия")
                if missing_616:
                    calculation_notes.append(
                        "Формула (6.16) не вычислена: добавьте " + ", ".join(missing_616)
                    )
                else:
                    try:
                        dynamic_load_616 = calculate_contact_dynamic_load_616(
                            delta_h=numeric["delta_h"],
                            pitch_difference_factor=numeric["g0"],
                            velocity_m_s=numeric["velocity"],
                            center_distance_mm=effective_aw_613,
                            ratio=effective_u_613,
                            limit_n_per_mm=numeric.get("whv_limit"),
                        )
                    except CylindricalCalculationError as exc:
                        raise AssistantProtocolError(str(exc)) from exc
                    effective_whv = dynamic_load_616.specific_load_n_per_mm
                    derived_parameters.append((
                        "Удельная динамическая окружная сила по формуле 6.16",
                        "wHv_616",
                        effective_whv,
                        "Н/мм",
                    ))
                    calculation_notes.append(
                        "Формула (6.16), стр. 55: рассчитана удельная динамическая окружная сила"
                        + ("; применён предел из таблицы 6.14" if dynamic_load_616.limited else "")
                    )

            effective_khv = numeric.get("khv")
            if effective_khv is None and effective_whv is not None:
                missing_615 = []
                if "bw" not in numeric:
                    missing_615.append("bw")
                if effective_ft_614 is None:
                    missing_615.append("Ft либо рассчитанные силы")
                if "khalpha" not in numeric:
                    missing_615.append("KHalpha")
                if "khbeta" not in numeric:
                    missing_615.append("KHbeta")
                if missing_615:
                    calculation_notes.append(
                        "Формула (6.15) не вычислена: добавьте " + ", ".join(missing_615)
                    )
                else:
                    try:
                        effective_khv = calculate_contact_dynamic_factor_615(
                            dynamic_specific_load_n_per_mm=effective_whv,
                            face_width_mm=numeric["bw"],
                            tangential_force_n=effective_ft_614,
                            transverse_load_factor=numeric["khalpha"],
                            face_load_factor=numeric["khbeta"],
                        )
                    except CylindricalCalculationError as exc:
                        raise AssistantProtocolError(str(exc)) from exc
                    derived_parameters.append((
                        "Коэффициент динамической нагрузки по формуле 6.15",
                        "KHv_615",
                        effective_khv,
                        "-",
                    ))
                    calculation_notes.append("Формула (6.15), стр. 54: рассчитан коэффициент KHv")

            effective_wht = numeric.get("wht")
            if effective_wht is None and effective_khv is not None:
                missing_614 = []
                if effective_ft_614 is None:
                    missing_614.append("Ft либо рассчитанные силы")
                for symbol, label in (("bw", "bw"), ("khalpha", "KHalpha"), ("khbeta", "KHbeta")):
                    if symbol not in numeric:
                        missing_614.append(label)
                if missing_614:
                    calculation_notes.append(
                        "Формула (6.14) не вычислена: добавьте " + ", ".join(missing_614)
                    )
                else:
                    try:
                        effective_wht = calculate_contact_specific_load_614(
                            tangential_force_n=effective_ft_614,
                            face_width_mm=numeric["bw"],
                            transverse_load_factor=numeric["khalpha"],
                            face_load_factor=numeric["khbeta"],
                            dynamic_factor=effective_khv,
                        )
                    except CylindricalCalculationError as exc:
                        raise AssistantProtocolError(str(exc)) from exc
                    derived_parameters.append((
                        "Расчётная удельная окружная сила по формуле 6.14",
                        "wHt_614",
                        effective_wht,
                        "Н/мм",
                    ))
                    calculation_notes.append("Формула (6.14), стр. 54: рассчитана величина wHt")

            required_613 = {
                "zh": numeric.get("zh"),
                "zm": numeric.get("zm"),
                "Zepsilon": numeric.get("zepsilon"),
                "wHt либо данные формул (6.14)–(6.16)": effective_wht,
                "u либо геометрия": effective_u_613,
                "dw1 либо геометрия": effective_dw1_613,
                "sigmaHP либо данные формул (6.3)/(6.7)": effective_sigma_hp,
                "engagement": engagement_internal,
            }
            missing_613 = [label for label, value in required_613.items() if value is None]
            if missing_613:
                calculation_notes.append(
                    "Формула (6.13) не вычислена: добавьте " + ", ".join(missing_613)
                )
            else:
                try:
                    contact_613 = check_contact_stress_613(
                        geometry_factor=numeric["zh"],
                        elasticity_factor=numeric["zm"],
                        contact_ratio_factor=numeric["zepsilon"],
                        specific_load_n_per_mm=effective_wht,
                        ratio=effective_u_613,
                        pinion_working_diameter_mm=effective_dw1_613,
                        allowable_stress_mpa=effective_sigma_hp,
                        internal_gearing=engagement_internal,
                    )
                except CylindricalCalculationError as exc:
                    raise AssistantProtocolError(str(exc)) from exc
                derived_parameters.extend((
                    ("Контактное напряжение по формуле 6.13", "sigmaH_613", contact_613.stress_mpa, "МПа"),
                    ("Использование допуска по формуле 6.13", "utilH_613", contact_613.utilization, "-"),
                ))
                calculation_notes.append(
                    "Формула (6.13), стр. 53: условие "
                    + ("выполнено" if contact_613.passes else "НЕ ВЫПОЛНЕНО")
                    + f"; σH={contact_613.stress_mpa:.6g} МПа, "
                    + f"σHP={contact_613.allowable_stress_mpa:.6g} МПа"
                )

        bending_check_symbols = {
            "yf1", "yepsilon", "ybeta", "wft", "wfv", "wfv_limit", "delta_f",
            "kfalpha", "kfbeta", "kfv", "accuracy_grade", "epsilon_alpha",
        }
        bending_check_requested = bool(bending_check_symbols & set(numeric))
        if bending_check_requested:
            effective_aw_621 = numeric.get("aw")
            effective_u_621 = numeric.get("u")
            effective_ft_618 = numeric.get("ft")
            effective_module_617 = numeric.get("m")
            if geometry is not None:
                effective_aw_621 = effective_aw_621 or geometry.center_distance_mm
                effective_u_621 = effective_u_621 or geometry.ratio
            if forces is not None:
                effective_ft_618 = effective_ft_618 or forces.tangential_force_n

            effective_ybeta = numeric.get("ybeta")
            if effective_ybeta is None and tooth_form is not None and "beta" in numeric:
                try:
                    effective_ybeta = calculate_bending_helix_factor(
                        tooth_form=tooth_form,
                        helix_angle_deg=numeric["beta"],
                    )
                except CylindricalCalculationError as exc:
                    raise AssistantProtocolError(str(exc)) from exc
                derived_parameters.append((
                    "Коэффициент наклона зуба для формулы 6.17",
                    "Ybeta_617",
                    effective_ybeta,
                    "-",
                ))

            effective_yepsilon = numeric.get("yepsilon")
            if effective_yepsilon is None and tooth_form in {"helical", "herringbone"}:
                effective_yepsilon = 1.0
                derived_parameters.append((
                    "Коэффициент перекрытия для формулы 6.17",
                    "Yepsilon_617",
                    effective_yepsilon,
                    "-",
                ))

            effective_kfalpha = numeric.get("kfalpha")
            if effective_kfalpha is None and tooth_form == "spur":
                effective_kfalpha = 1.0
            elif (
                effective_kfalpha is None
                and tooth_form == "helical"
                and numeric.get("epsilon_beta") is not None
                and numeric["epsilon_beta"] <= 1
            ):
                effective_kfalpha = 1.0
            elif effective_kfalpha is None and tooth_form in {"helical", "herringbone"}:
                missing_619 = sorted({"epsilon_alpha", "epsilon_beta", "accuracy_grade"} - set(numeric))
                if missing_619:
                    calculation_notes.append(
                        "Формула (6.19) не вычислена: добавьте " + ", ".join(missing_619)
                    )
                else:
                    if not numeric["accuracy_grade"].is_integer():
                        raise AssistantProtocolError("accuracy_grade must be a whole number")
                    try:
                        effective_kfalpha = calculate_bending_transverse_factor_619(
                            tooth_form=tooth_form,
                            axial_contact_ratio=numeric["epsilon_beta"],
                            transverse_contact_ratio=numeric["epsilon_alpha"],
                            accuracy_grade=int(numeric["accuracy_grade"]),
                        )
                    except CylindricalCalculationError as exc:
                        raise AssistantProtocolError(str(exc)) from exc
                    derived_parameters.append((
                        "Коэффициент распределения нагрузки по формуле 6.19",
                        "KFalpha_619",
                        effective_kfalpha,
                        "-",
                    ))
                    calculation_notes.append("Формула (6.19), стр. 56: рассчитан коэффициент KFalpha")

            effective_wfv = numeric.get("wfv")
            dynamic_bending_requested = bool(
                {"delta_f", "g0", "velocity", "wfv_limit"} & set(numeric)
            )
            if effective_wfv is None and dynamic_bending_requested:
                missing_621 = sorted({"delta_f", "g0", "velocity"} - set(numeric))
                if effective_aw_621 is None:
                    missing_621.append("aw либо геометрия")
                if effective_u_621 is None:
                    missing_621.append("u либо геометрия")
                if missing_621:
                    calculation_notes.append(
                        "Формула (6.21) не вычислена: добавьте " + ", ".join(missing_621)
                    )
                else:
                    try:
                        dynamic_load_621 = calculate_bending_dynamic_load_621(
                            delta_f=numeric["delta_f"],
                            pitch_difference_factor=numeric["g0"],
                            velocity_m_s=numeric["velocity"],
                            center_distance_mm=effective_aw_621,
                            ratio=effective_u_621,
                            limit_n_per_mm=numeric.get("wfv_limit"),
                        )
                    except CylindricalCalculationError as exc:
                        raise AssistantProtocolError(str(exc)) from exc
                    effective_wfv = dynamic_load_621.specific_load_n_per_mm
                    derived_parameters.append((
                        "Удельная динамическая сила при изгибе по формуле 6.21",
                        "wFv_621",
                        effective_wfv,
                        "Н/мм",
                    ))
                    calculation_notes.append(
                        "Формула (6.21), стр. 56: рассчитана удельная динамическая окружная сила"
                        + ("; применён предел из таблицы 6.14" if dynamic_load_621.limited else "")
                    )

            effective_kfv = numeric.get("kfv")
            if effective_kfv is None and effective_wfv is not None:
                missing_620 = []
                if "bw" not in numeric:
                    missing_620.append("bw")
                if effective_ft_618 is None:
                    missing_620.append("Ft либо рассчитанные силы")
                if effective_kfalpha is None:
                    missing_620.append("KFalpha либо данные формулы (6.19)")
                if "kfbeta" not in numeric:
                    missing_620.append("KFbeta")
                if missing_620:
                    calculation_notes.append(
                        "Формула (6.20) не вычислена: добавьте " + ", ".join(missing_620)
                    )
                else:
                    try:
                        effective_kfv = calculate_bending_dynamic_factor_620(
                            dynamic_specific_load_n_per_mm=effective_wfv,
                            face_width_mm=numeric["bw"],
                            tangential_force_n=effective_ft_618,
                            transverse_load_factor=effective_kfalpha,
                            face_load_factor=numeric["kfbeta"],
                        )
                    except CylindricalCalculationError as exc:
                        raise AssistantProtocolError(str(exc)) from exc
                    derived_parameters.append((
                        "Коэффициент динамической нагрузки по формуле 6.20",
                        "KFv_620",
                        effective_kfv,
                        "-",
                    ))
                    calculation_notes.append("Формула (6.20), стр. 56: рассчитан коэффициент KFv")

            effective_wft = numeric.get("wft")
            if effective_wft is None and effective_kfv is not None:
                missing_618 = []
                if effective_ft_618 is None:
                    missing_618.append("Ft либо рассчитанные силы")
                if "bw" not in numeric:
                    missing_618.append("bw")
                if effective_kfalpha is None:
                    missing_618.append("KFalpha либо данные формулы (6.19)")
                if "kfbeta" not in numeric:
                    missing_618.append("KFbeta")
                if missing_618:
                    calculation_notes.append(
                        "Формула (6.18) не вычислена: добавьте " + ", ".join(missing_618)
                    )
                else:
                    try:
                        effective_wft = calculate_bending_specific_load_618(
                            tangential_force_n=effective_ft_618,
                            face_width_mm=numeric["bw"],
                            transverse_load_factor=effective_kfalpha,
                            face_load_factor=numeric["kfbeta"],
                            dynamic_factor=effective_kfv,
                        )
                    except CylindricalCalculationError as exc:
                        raise AssistantProtocolError(str(exc)) from exc
                    derived_parameters.append((
                        "Расчётная удельная сила при изгибе по формуле 6.18",
                        "wFt_618",
                        effective_wft,
                        "Н/мм",
                    ))
                    calculation_notes.append("Формула (6.18), стр. 56: рассчитана величина wFt")

            required_617 = {
                "YF1": numeric.get("yf1"),
                "Yepsilon": effective_yepsilon,
                "Ybeta": effective_ybeta,
                "wFt либо данные формул (6.18)–(6.21)": effective_wft,
                "m либо геометрия": effective_module_617,
                "sigmaFP1 либо данные формул (6.9)–(6.11)": allowable_bending_stress,
            }
            missing_617 = [label for label, value in required_617.items() if value is None]
            if missing_617:
                calculation_notes.append(
                    "Формула (6.17) не вычислена: добавьте " + ", ".join(missing_617)
                )
            else:
                try:
                    bending_617 = check_bending_stress_617(
                        tooth_form_factor=numeric["yf1"],
                        overlap_factor=effective_yepsilon,
                        helix_factor=effective_ybeta,
                        specific_load_n_per_mm=effective_wft,
                        module_mm=effective_module_617,
                        allowable_stress_mpa=allowable_bending_stress,
                    )
                except CylindricalCalculationError as exc:
                    raise AssistantProtocolError(str(exc)) from exc
                derived_parameters.extend((
                    ("Напряжение изгиба по формуле 6.17", "sigmaF_617", bending_617.stress_mpa, "МПа"),
                    ("Использование допуска по формуле 6.17", "utilF_617", bending_617.utilization, "-"),
                ))
                calculation_notes.append(
                    "Формула (6.17), стр. 56: условие "
                    + ("выполнено" if bending_617.passes else "НЕ ВЫПОЛНЕНО")
                    + f"; σF={bending_617.stress_mpa:.6g} МПа, "
                    + f"σFP={bending_617.allowable_stress_mpa:.6g} МПа"
                )

        effective_sigma_h_622 = numeric.get("sigma_h")
        if contact_613 is not None:
            effective_sigma_h_622 = effective_sigma_h_622 or contact_613.stress_mpa
        maximum_contact_requested = bool(
            {"sigma_h", "t1max", "t1", "sigma_hpmax"} & set(numeric)
        ) or contact_613 is not None
        if maximum_contact_requested:
            missing_622 = sorted({"t1max", "t1", "sigma_hpmax"} - set(numeric))
            if effective_sigma_h_622 is None:
                missing_622.append("sigmaH либо результат формулы (6.13)")
            if missing_622:
                calculation_notes.append(
                    "Формула (6.22) не вычислена: добавьте " + ", ".join(missing_622)
                )
            else:
                try:
                    maximum_contact_622 = check_maximum_contact(
                        operating_stress_mpa=effective_sigma_h_622,
                        maximum_torque_nm=numeric["t1max"],
                        operating_torque_nm=numeric["t1"],
                        allowable_maximum_stress_mpa=numeric["sigma_hpmax"],
                    )
                except CylindricalCalculationError as exc:
                    raise AssistantProtocolError(str(exc)) from exc
                derived_parameters.extend((
                    (
                        "Контактное напряжение при максимальной нагрузке",
                        "sigmaHmax_622",
                        maximum_contact_622.maximum_stress_mpa,
                        "МПа",
                    ),
                    (
                        "Использование контактного допуска по формуле 6.22",
                        "utilHmax_622",
                        maximum_contact_622.utilization,
                        "-",
                    ),
                ))
                calculation_notes.append(
                    "Формула (6.22), стр. 56: условие "
                    + ("выполнено" if maximum_contact_622.passes else "НЕ ВЫПОЛНЕНО")
                    + f"; σHmax={maximum_contact_622.maximum_stress_mpa:.6g} МПа, "
                    + f"σHPmax={maximum_contact_622.allowable_stress_mpa:.6g} МПа"
                )

        bending_required = {"sigma_f", "t1max", "t1", "sigma_fpmax"}
        if bending_required.issubset(numeric):
            try:
                bending = check_maximum_bending(
                    operating_stress_mpa=numeric["sigma_f"],
                    maximum_torque_nm=numeric["t1max"],
                    operating_torque_nm=numeric["t1"],
                    allowable_maximum_stress_mpa=numeric["sigma_fpmax"],
                )
            except CylindricalCalculationError as exc:
                raise AssistantProtocolError(str(exc)) from exc
            derived_parameters.extend((
                ("Напряжение изгиба при максимальной нагрузке", "sigmaFmax", bending.maximum_stress_mpa, "МПа"),
                ("Использование допуска по формуле 6.23", "utilFmax", bending.utilization, "-"),
            ))
            calculation_notes.append(
                "Формула (6.23): условие "
                + ("выполнено" if bending.passes else "НЕ ВЫПОЛНЕНО")
                + f"; σFmax={bending.maximum_stress_mpa:.6g} МПа, "
                + f"σFPmax={bending.allowable_stress_mpa:.6g} МПа"
            )
        elif assignment.calculation_mode == "verification":
            calculation_notes.append(
                "Проверка по формуле (6.23) не выполнена: нужны sigmaF, T1max, T1 и sigmaFPmax"
            )

        # Do not add a calculated duplicate when the same value was supplied
        # explicitly. This filtering must run after all calculation stages.
        derived_parameters = [
            item for item in derived_parameters
            if normalize_symbol(item[1]) not in numeric
        ]

    for index, (name, symbol, value, unit) in enumerate(derived_parameters):
        operations.append({
            "operation_id": f"calculated-parameter-{index + 1}",
            "type": "add_parameter",
            "arguments": {
                "object_operation_id": "assignment-object",
                "attributes": {
                    "name": name,
                    "group": "5",
                    "number": str(next_number + len(assignment.inputs) + index),
                    "sign": symbol,
                    "codingType": "1",
                    "value": f"{value:.10g}",
                    "unit": unit,
                },
            },
        })
    if assignment.notes.strip():
        manual_checks.append("Примечание к заданию: " + assignment.notes.strip())
    manual_checks.append("Проверить обозначения, размерности и связи параметров по выданному заданию")
    if assignment.perform_calculations:
        manual_checks.append(
            "Дополнительная проверка: сверить примененные формулы, коэффициенты и размерности с методичкой"
        )
    manual_checks.extend(calculation_notes)
    for step in route:
        if step.verification == "manually_verified":
            manual_checks.append(
                f"Методическая зависимость: {step.reference}, стр. {step.page_label}"
                + (f" — {step.expression}" if step.expression else "")
            )
        elif assignment.perform_calculations:
            manual_checks.append(
                f"Для дополнительной проверки сверить {step.reference} на стр. {step.page_label}: {step.title}"
            )
        else:
            manual_checks.append(
                f"Сверить описание зависимости {step.reference} на стр. {step.page_label}: {step.title}"
            )
    topics = recommend_topics(assignment.transmission_kind, assignment.calculation_mode)
    if any(topic.verification != "manually_verified" for topic in topics):
        manual_checks.append("Текст выбранных тем получен OCR: формулы, индексы и таблицы сверить с вложенными сканами")

    if assignment.perform_calculations:
        calculation_scope = (
            "Включена необязательная численная проверка формул; она не является частью обязательного "
            "результата курсовой и требует ручной сверки"
        )
        summary = f"Создать схему и дополнительно проверить формулы: {mode.lower()}, {transmission.lower()}"
    else:
        calculation_scope = (
            "Курсовая требует схему ИС-2: создаются действия, символические параметры, связи и ссылки "
            "на методику; численные вычисления не выполняются"
        )
        summary = f"Создать схему ИС-2: {mode.lower()}, {transmission.lower()}"

    return AssistantPlan.from_dict({
        "protocol_version": 1,
        "summary": summary,
        "assumptions": [
            calculation_scope,
            "Поля value и unit необязательны; для схемы достаточно обозначений, размерностей и связей параметров",
        ],
        "questions": [],
        "operations": operations,
        "sources": [
            {
                "title": topic.display_title,
                "locator": f"Детали машин, печатные страницы {topic.page_label}"
                + (f"; {topic.note}" if topic.note else ""),
            }
            for topic in topics
        ],
        "manual_checks": manual_checks,
    })

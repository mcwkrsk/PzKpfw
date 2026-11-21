"""Verified cylindrical-gear calculations from formulas 6.1–6.23."""
from __future__ import annotations

from dataclasses import dataclass
import math
from typing import Iterable, Mapping


class CylindricalCalculationError(ValueError):
    """Raised when supplied engineering inputs are missing or inconsistent."""


@dataclass(frozen=True)
class CylindricalGeometryInput:
    z1: int
    z2: int
    module_mm: float
    beta_deg: float
    x1: float
    x2: float
    center_distance_mm: float | None = None


@dataclass(frozen=True)
class CylindricalGeometryResult:
    ratio: float
    pitch_center_distance_mm: float
    center_distance_mm: float
    transverse_pressure_angle_deg: float
    working_pressure_angle_deg: float
    shift_sum: float
    perceived_shift: float
    equalizing_shift: float
    pitch_diameter_1_mm: float
    pitch_diameter_2_mm: float
    working_diameter_1_mm: float
    working_diameter_2_mm: float
    tip_diameter_1_mm: float
    tip_diameter_2_mm: float
    root_diameter_1_mm: float
    root_diameter_2_mm: float


@dataclass(frozen=True)
class CylindricalForceResult:
    torque_nm: float
    tangential_force_n: float
    radial_force_n: float
    axial_force_n: float


@dataclass(frozen=True)
class MaximumBendingResult:
    maximum_stress_mpa: float
    allowable_stress_mpa: float
    utilization: float
    passes: bool


@dataclass(frozen=True)
class MaximumContactResult:
    maximum_stress_mpa: float
    allowable_stress_mpa: float
    utilization: float
    passes: bool


@dataclass(frozen=True)
class CenterDistanceDesignResult:
    center_distance_mm: float
    internal_gearing: bool


@dataclass(frozen=True)
class PinionDiameterDesignResult:
    pinion_diameter_mm: float
    internal_gearing: bool


@dataclass(frozen=True)
class ContactLifeFactorResult:
    factor: float
    uncapped_factor: float
    maximum_factor: float
    capped: bool


@dataclass(frozen=True)
class EquivalentContactCyclesResult:
    equivalent_cycles: float
    total_cycles: float


@dataclass(frozen=True)
class LoadSpectrumStep:
    torque_nm: float
    cycles: float


@dataclass(frozen=True)
class CombinedContactStressResult:
    allowable_stress_mpa: float
    uncapped_stress_mpa: float
    limit_stress_mpa: float
    limited: bool
    tooth_form: str


@dataclass(frozen=True)
class BendingLifeFactorResult:
    factor: float
    uncapped_factor: float
    maximum_factor: float
    capped: bool
    exponent: int


@dataclass(frozen=True)
class BendingDesignCoefficients:
    kma: float
    km: float


@dataclass(frozen=True)
class DynamicSpecificLoadResult:
    specific_load_n_per_mm: float
    uncapped_load_n_per_mm: float
    limit_n_per_mm: float | None
    limited: bool


@dataclass(frozen=True)
class ContactStressCheckResult:
    stress_mpa: float
    allowable_stress_mpa: float
    utilization: float
    passes: bool


@dataclass(frozen=True)
class BendingStressCheckResult:
    stress_mpa: float
    allowable_stress_mpa: float
    utilization: float
    passes: bool


def involute(angle_rad: float) -> float:
    return math.tan(angle_rad) - angle_rad


def inverse_involute(value: float) -> float:
    if not math.isfinite(value) or value < 0:
        raise CylindricalCalculationError("involute value must be finite and non-negative")
    low = 0.0
    high = math.radians(60.0)
    if value > involute(high):
        raise CylindricalCalculationError("working pressure angle exceeds the supported 60° safety bound")
    for _ in range(100):
        middle = (low + high) / 2
        if involute(middle) < value:
            low = middle
        else:
            high = middle
    return (low + high) / 2


def calculate_geometry(data: CylindricalGeometryInput) -> CylindricalGeometryResult:
    if isinstance(data.z1, bool) or isinstance(data.z2, bool) or data.z1 < 6 or data.z2 < 6:
        raise CylindricalCalculationError("z1 and z2 must be integers of at least 6 teeth")
    values = (data.module_mm, data.beta_deg, data.x1, data.x2)
    if any(not math.isfinite(float(value)) for value in values):
        raise CylindricalCalculationError("geometry inputs must be finite numbers")
    if data.module_mm <= 0:
        raise CylindricalCalculationError("module m must be positive")
    if abs(data.beta_deg) >= 45:
        raise CylindricalCalculationError("absolute helix angle beta must be below 45°")

    beta = math.radians(data.beta_deg)
    cos_beta = math.cos(beta)
    alpha = math.radians(20.0)
    alpha_t = math.atan(math.tan(alpha) / cos_beta)
    pitch_center = (data.z1 + data.z2) * data.module_mm / (2 * cos_beta)
    requested_shift_sum = data.x1 + data.x2

    if data.center_distance_mm is None:
        target_involute = involute(alpha_t) + (
            2 * requested_shift_sum * math.tan(alpha) / (data.z1 + data.z2)
        )
        alpha_tw = inverse_involute(target_involute)
        center_distance = pitch_center * math.cos(alpha_t) / math.cos(alpha_tw)
        shift_sum = requested_shift_sum
    else:
        center_distance = float(data.center_distance_mm)
        if not math.isfinite(center_distance) or center_distance <= 0:
            raise CylindricalCalculationError("center distance aw must be a positive finite number")
        cosine = (pitch_center / center_distance) * math.cos(alpha_t)
        if cosine <= 0 or cosine > 1:
            raise CylindricalCalculationError("center distance aw is incompatible with z1, z2, m and beta")
        alpha_tw = math.acos(cosine)
        shift_sum = (data.z1 + data.z2) * (
            involute(alpha_tw) - involute(alpha_t)
        ) / (2 * math.tan(alpha))
        if not math.isclose(shift_sum, requested_shift_sum, rel_tol=1e-6, abs_tol=1e-5):
            raise CylindricalCalculationError(
                f"x1+x2={requested_shift_sum:.6g} conflicts with aw; table 6.15 gives xΣ={shift_sum:.6g}"
            )

    ratio = data.z2 / data.z1
    d1 = data.z1 * data.module_mm / cos_beta
    d2 = data.z2 * data.module_mm / cos_beta
    dw1 = 2 * center_distance / (ratio + 1)
    dw2 = 2 * center_distance * ratio / (ratio + 1)
    perceived_shift = (center_distance - pitch_center) / data.module_mm
    equalizing_shift = shift_sum - perceived_shift
    if math.isclose(perceived_shift, 0.0, abs_tol=1e-12):
        perceived_shift = 0.0
    if math.isclose(equalizing_shift, 0.0, abs_tol=1e-12):
        equalizing_shift = 0.0
    da1 = d1 + 2 * (1 + data.x1 - equalizing_shift) * data.module_mm
    da2 = d2 + 2 * (1 + data.x2 - equalizing_shift) * data.module_mm
    df1 = d1 - 2 * (1.25 - data.x1) * data.module_mm
    df2 = d2 - 2 * (1.25 - data.x2) * data.module_mm

    return CylindricalGeometryResult(
        ratio=ratio,
        pitch_center_distance_mm=pitch_center,
        center_distance_mm=center_distance,
        transverse_pressure_angle_deg=math.degrees(alpha_t),
        working_pressure_angle_deg=math.degrees(alpha_tw),
        shift_sum=shift_sum,
        perceived_shift=perceived_shift,
        equalizing_shift=equalizing_shift,
        pitch_diameter_1_mm=d1,
        pitch_diameter_2_mm=d2,
        working_diameter_1_mm=dw1,
        working_diameter_2_mm=dw2,
        tip_diameter_1_mm=da1,
        tip_diameter_2_mm=da2,
        root_diameter_1_mm=df1,
        root_diameter_2_mm=df2,
    )


def calculate_forces(
    geometry: CylindricalGeometryResult,
    *,
    beta_deg: float,
    torque_nm: float | None = None,
    power_kw: float | None = None,
    speed_rpm: float | None = None,
) -> CylindricalForceResult:
    if torque_nm is None:
        if power_kw is None or speed_rpm is None:
            raise CylindricalCalculationError("provide T1 or both N and n1 for the force calculation")
        if not math.isfinite(power_kw) or power_kw <= 0 or not math.isfinite(speed_rpm) or speed_rpm <= 0:
            raise CylindricalCalculationError("N and n1 must be positive finite numbers")
        torque_nm = 9.55e3 * power_kw / speed_rpm
    if not math.isfinite(torque_nm) or torque_nm <= 0:
        raise CylindricalCalculationError("T1 must be a positive finite number")
    tangential = 2e3 * torque_nm / geometry.working_diameter_1_mm
    radial = tangential * math.tan(math.radians(geometry.working_pressure_angle_deg))
    axial = tangential * math.tan(math.radians(beta_deg))
    return CylindricalForceResult(
        torque_nm=torque_nm,
        tangential_force_n=tangential,
        radial_force_n=radial,
        axial_force_n=axial,
    )


def check_maximum_bending(
    *,
    operating_stress_mpa: float,
    maximum_torque_nm: float,
    operating_torque_nm: float,
    allowable_maximum_stress_mpa: float,
) -> MaximumBendingResult:
    """Evaluate manually verified formula (6.23)."""
    values = (
        operating_stress_mpa,
        maximum_torque_nm,
        operating_torque_nm,
        allowable_maximum_stress_mpa,
    )
    if any(not math.isfinite(value) or value <= 0 for value in values):
        raise CylindricalCalculationError("formula (6.23) inputs must be positive finite numbers")
    maximum_stress = operating_stress_mpa * maximum_torque_nm / operating_torque_nm
    utilization = maximum_stress / allowable_maximum_stress_mpa
    return MaximumBendingResult(
        maximum_stress_mpa=maximum_stress,
        allowable_stress_mpa=allowable_maximum_stress_mpa,
        utilization=utilization,
        passes=maximum_stress <= allowable_maximum_stress_mpa,
    )


def check_maximum_contact(
    *,
    operating_stress_mpa: float,
    maximum_torque_nm: float,
    operating_torque_nm: float,
    allowable_maximum_stress_mpa: float,
) -> MaximumContactResult:
    """Evaluate manually verified formula (6.22)."""
    values = (
        operating_stress_mpa,
        maximum_torque_nm,
        operating_torque_nm,
        allowable_maximum_stress_mpa,
    )
    if any(not math.isfinite(value) or value <= 0 for value in values):
        raise CylindricalCalculationError("formula (6.22) inputs must be positive finite numbers")
    maximum_stress = operating_stress_mpa * math.sqrt(maximum_torque_nm / operating_torque_nm)
    utilization = maximum_stress / allowable_maximum_stress_mpa
    return MaximumContactResult(
        maximum_stress_mpa=maximum_stress,
        allowable_stress_mpa=allowable_maximum_stress_mpa,
        utilization=utilization,
        passes=maximum_stress <= allowable_maximum_stress_mpa,
    )


def _design_span(ratio: float, internal_gearing: bool) -> float:
    if not math.isfinite(ratio) or ratio < 1:
        raise CylindricalCalculationError("gear ratio u must be a finite number of at least 1")
    span = ratio - 1 if internal_gearing else ratio + 1
    if span <= 0:
        raise CylindricalCalculationError("internal gearing requires u greater than 1")
    return span


def _positive_design_inputs(**values: float) -> None:
    invalid = [name for name, value in values.items() if not math.isfinite(value) or value <= 0]
    if invalid:
        raise CylindricalCalculationError(
            "design formula inputs must be positive finite numbers: " + ", ".join(invalid)
        )


def calculate_center_distance_61(
    *,
    coefficient_ka: float,
    ratio: float,
    torque_nm: float,
    load_distribution_factor: float,
    face_width_ratio_ba: float,
    allowable_contact_stress_mpa: float,
    internal_gearing: bool,
) -> CenterDistanceDesignResult:
    """Calculate ``a_w`` using manually verified formula (6.1), page 44."""
    _positive_design_inputs(
        Ka=coefficient_ka,
        T1=torque_nm,
        KHbeta=load_distribution_factor,
        psi_ba=face_width_ratio_ba,
        sigmaHP=allowable_contact_stress_mpa,
    )
    span = _design_span(ratio, internal_gearing)
    core = (
        torque_nm * load_distribution_factor
        / (ratio * face_width_ratio_ba * allowable_contact_stress_mpa**2)
    )
    return CenterDistanceDesignResult(
        center_distance_mm=coefficient_ka * span * core ** (1 / 3),
        internal_gearing=internal_gearing,
    )


def calculate_pinion_diameter_62(
    *,
    coefficient_kd: float,
    ratio: float,
    torque_nm: float,
    load_distribution_factor: float,
    face_width_ratio_bd: float,
    allowable_contact_stress_mpa: float,
    internal_gearing: bool,
) -> PinionDiameterDesignResult:
    """Calculate ``d_w1`` using manually verified formula (6.2), page 46."""
    _positive_design_inputs(
        Kd=coefficient_kd,
        T1=torque_nm,
        KHbeta=load_distribution_factor,
        psi_bd=face_width_ratio_bd,
        sigmaHP=allowable_contact_stress_mpa,
    )
    span = _design_span(ratio, internal_gearing)
    core = (
        torque_nm * load_distribution_factor * span
        / (ratio * face_width_ratio_bd * allowable_contact_stress_mpa**2)
    )
    return PinionDiameterDesignResult(
        pinion_diameter_mm=coefficient_kd * core ** (1 / 3),
        internal_gearing=internal_gearing,
    )


def parse_engagement(value: str) -> bool:
    """Return ``True`` for internal gearing and ``False`` for external."""
    normalized = value.strip().casefold().replace("ё", "е")
    external = {"external", "внешнее", "внешнее зацепление", "наружное", "+"}
    internal = {"internal", "внутреннее", "внутреннее зацепление", "-"}
    if normalized in external:
        return False
    if normalized in internal:
        return True
    raise CylindricalCalculationError(
        "engagement must be external/внешнее or internal/внутреннее"
    )


CONTACT_LIFE_LIMITS = {
    "steel_through": 2.6,
    "steel_surface": 1.8,
    "cast_iron": 1.4,
    "nonmetal": 1.0,
}


def parse_contact_life_category(value: str) -> str:
    normalized = value.strip().casefold().replace("ё", "е")
    aliases = {
        "steel_through": "steel_through",
        "объемно упрочненная сталь": "steel_through",
        "объемная сталь": "steel_through",
        "steel_surface": "steel_surface",
        "поверхностно упрочненная сталь": "steel_surface",
        "поверхностная сталь": "steel_surface",
        "cast_iron": "cast_iron",
        "чугун": "cast_iron",
        "nonmetal": "nonmetal",
        "неметалл": "nonmetal",
        "неметаллическое": "nonmetal",
    }
    try:
        return aliases[normalized]
    except KeyError as exc:
        raise CylindricalCalculationError(
            "life_category must be steel_through, steel_surface, cast_iron or nonmetal"
        ) from exc


def calculate_allowable_contact_stress_63(
    *, base_stress_mpa: float, life_factor: float,
) -> float:
    """Calculate allowable contact stress using formula (6.3), page 46."""
    _positive_design_inputs(sigmaHPprime=base_stress_mpa, KHL=life_factor)
    return base_stress_mpa * life_factor


def calculate_contact_life_factor_64(
    *, base_cycles: float, equivalent_cycles: float, category: str,
) -> ContactLifeFactorResult:
    """Calculate and cap ``K_HL`` using formula (6.4), pages 48-50."""
    _positive_design_inputs(NH0=base_cycles, NHE=equivalent_cycles)
    if category not in CONTACT_LIFE_LIMITS:
        raise CylindricalCalculationError(f"unsupported contact life category: {category!r}")
    maximum = CONTACT_LIFE_LIMITS[category]
    uncapped = 1.0 if equivalent_cycles >= base_cycles else (base_cycles / equivalent_cycles) ** (1 / 6)
    factor = min(uncapped, maximum)
    return ContactLifeFactorResult(
        factor=factor,
        uncapped_factor=uncapped,
        maximum_factor=maximum,
        capped=factor < uncapped,
    )


def calculate_equivalent_cycles_65(*, operating_hours: float, speed_rpm: float) -> float:
    """Calculate ``N_HE = 60 t_h n`` for constant loading, formula (6.5)."""
    _positive_design_inputs(th=operating_hours, n=speed_rpm)
    return 60 * operating_hours * speed_rpm


def calculate_equivalent_cycles_66(
    *, reference_torque_nm: float, steps: Iterable[LoadSpectrumStep],
) -> EquivalentContactCyclesResult:
    """Calculate equivalent cycles for a stepped load spectrum, formula (6.6)."""
    _positive_design_inputs(T1=reference_torque_nm)
    prepared = tuple(steps)
    if not prepared:
        raise CylindricalCalculationError("formula (6.6) requires at least one load step")
    for index, step in enumerate(prepared, start=1):
        _positive_design_inputs(**{
            f"T1_{index}": step.torque_nm,
            f"cycles_{index}": step.cycles,
        })
    total = sum(step.cycles for step in prepared)
    equivalent = sum(
        (step.torque_nm / reference_torque_nm) ** 3 * step.cycles
        for step in prepared
    )
    return EquivalentContactCyclesResult(equivalent_cycles=equivalent, total_cycles=total)


def parse_load_spectrum(value: str) -> tuple[LoadSpectrumStep, ...]:
    """Parse ``torque:cycles; ...`` rows for formula (6.6)."""
    result = []
    for index, raw_step in enumerate(value.split(";"), start=1):
        step = raw_step.strip()
        if not step:
            continue
        parts = [part.strip() for part in step.split(":")]
        if len(parts) != 2:
            raise CylindricalCalculationError(
                f"load_steps item {index} must have format torque:cycles"
            )
        result.append(LoadSpectrumStep(parse_number(parts[0]), parse_number(parts[1])))
    if not result:
        raise CylindricalCalculationError("load_steps must contain at least one torque:cycles item")
    return tuple(result)


def parse_tooth_form(value: str) -> str:
    normalized = value.strip().casefold().replace("ё", "е")
    aliases = {
        "spur": "spur", "прямозубая": "spur", "прямозубые": "spur",
        "helical": "helical", "косозубая": "helical", "косозубые": "helical",
        "herringbone": "herringbone", "шевронная": "herringbone", "шевронные": "herringbone",
    }
    try:
        return aliases[normalized]
    except KeyError as exc:
        raise CylindricalCalculationError(
            "tooth_form must be spur/прямозубая, helical/косозубая or herringbone/шевронная"
        ) from exc


def combine_allowable_contact_stress_67(
    *, stress_1_mpa: float, stress_2_mpa: float, tooth_form: str,
) -> CombinedContactStressResult:
    """Select/limit pair contact stress using formula (6.7), page 50."""
    _positive_design_inputs(sigmaHP1=stress_1_mpa, sigmaHP2=stress_2_mpa)
    if tooth_form == "spur":
        value = min(stress_1_mpa, stress_2_mpa)
        return CombinedContactStressResult(value, value, value, False, tooth_form)
    if tooth_form not in {"helical", "herringbone"}:
        raise CylindricalCalculationError(f"unsupported tooth form: {tooth_form!r}")
    uncapped = 0.45 * (stress_1_mpa + stress_2_mpa)
    limit = 1.23 * min(stress_1_mpa, stress_2_mpa)
    value = min(uncapped, limit)
    return CombinedContactStressResult(value, uncapped, limit, value < uncapped, tooth_form)


def bending_design_coefficients(
    *, tooth_form: str, overlap_ratio: float | None = None,
) -> BendingDesignCoefficients:
    """Return verified ``K_ma`` and ``K_m`` values stated on pages 50 and 53."""
    if tooth_form == "spur":
        return BendingDesignCoefficients(kma=1400.0, km=14.0)
    if tooth_form == "herringbone":
        return BendingDesignCoefficients(kma=850.0, km=11.2)
    if tooth_form != "helical":
        raise CylindricalCalculationError(f"unsupported tooth form: {tooth_form!r}")
    if overlap_ratio is None or not math.isfinite(overlap_ratio) or overlap_ratio <= 0:
        raise CylindricalCalculationError("helical gears require a positive overlap ratio epsilon_beta")
    if overlap_ratio <= 1:
        return BendingDesignCoefficients(kma=1100.0, km=12.5)
    return BendingDesignCoefficients(kma=850.0, km=11.2)


def calculate_bending_module_68(
    *,
    coefficient_kma: float,
    torque_nm: float,
    ratio: float,
    tooth_form_factor: float,
    center_distance_mm: float,
    face_width_mm: float,
    allowable_bending_stress_mpa: float,
    internal_gearing: bool,
) -> float:
    """Calculate module using manually verified formula (6.8), page 50."""
    _positive_design_inputs(
        Kma=coefficient_kma, T1=torque_nm, YF1=tooth_form_factor,
        aw=center_distance_mm, bw=face_width_mm, sigmaFP1=allowable_bending_stress_mpa,
    )
    span = _design_span(ratio, internal_gearing)
    return (
        coefficient_kma * torque_nm * span * tooth_form_factor
        / (center_distance_mm * face_width_mm * allowable_bending_stress_mpa)
    )


def calculate_allowable_bending_stress_69(
    *, base_stress_mpa: float, life_factor: float,
) -> float:
    """Calculate allowable bending stress using formula (6.9), page 50."""
    _positive_design_inputs(sigmaFPprime=base_stress_mpa, KFL=life_factor)
    return base_stress_mpa * life_factor


def calculate_bending_life_factor_610(
    *, base_cycles: float, equivalent_cycles: float, exponent: int,
) -> BendingLifeFactorResult:
    """Calculate and cap ``K_FL`` using formula (6.10), pages 50-52."""
    _positive_design_inputs(NF0=base_cycles, NFE=equivalent_cycles)
    if isinstance(exponent, bool) or exponent not in {6, 9}:
        raise CylindricalCalculationError("bending life exponent mF must be 6 or 9")
    maximum = 2.08 if exponent == 6 else 1.63
    uncapped = 1.0 if equivalent_cycles >= base_cycles else (base_cycles / equivalent_cycles) ** (1 / exponent)
    factor = min(uncapped, maximum)
    return BendingLifeFactorResult(factor, uncapped, maximum, factor < uncapped, exponent)


def calculate_equivalent_bending_cycles_611(
    *, reference_torque_nm: float, steps: Iterable[LoadSpectrumStep], exponent: int,
) -> EquivalentContactCyclesResult:
    """Calculate ``N_FE`` for a stepped spectrum using formula (6.11), page 52."""
    _positive_design_inputs(T1=reference_torque_nm)
    if isinstance(exponent, bool) or exponent not in {6, 9}:
        raise CylindricalCalculationError("bending spectrum exponent mF must be 6 or 9")
    prepared = tuple(steps)
    if not prepared:
        raise CylindricalCalculationError("formula (6.11) requires at least one load step")
    for index, step in enumerate(prepared, start=1):
        _positive_design_inputs(**{
            f"T1_{index}": step.torque_nm,
            f"cycles_{index}": step.cycles,
        })
    total = sum(step.cycles for step in prepared)
    equivalent = sum(
        (step.torque_nm / reference_torque_nm) ** exponent * step.cycles
        for step in prepared
    )
    return EquivalentContactCyclesResult(equivalent, total)


def calculate_minimum_bending_module_612(
    *,
    coefficient_km: float,
    torque_nm: float,
    load_distribution_factor: float,
    tooth_form_factor: float,
    pinion_teeth: int,
    face_width_ratio_bd: float,
    allowable_bending_stress_mpa: float,
) -> float:
    """Calculate minimum module using formula (6.12), page 52."""
    if isinstance(pinion_teeth, bool) or pinion_teeth < 1:
        raise CylindricalCalculationError("z1 must be a positive integer")
    _positive_design_inputs(
        Km=coefficient_km, T1=torque_nm, KFbeta=load_distribution_factor,
        YF1=tooth_form_factor, psi_bd=face_width_ratio_bd,
        sigmaFP1=allowable_bending_stress_mpa,
    )
    core = (
        torque_nm * load_distribution_factor * tooth_form_factor
        / (pinion_teeth**2 * face_width_ratio_bd * allowable_bending_stress_mpa)
    )
    return coefficient_km * core ** (1 / 3)


STANDARD_MODULE_SERIES_1 = (1.25, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 12.0)
STANDARD_MODULE_SERIES_2 = (1.375, 1.75, 2.25, 2.75, 3.5, 4.5, 5.5, 7.0, 9.0, 11.0, 14.0)


def round_standard_module(value_mm: float, *, prefer_first_series: bool = True) -> float:
    """Round upward using table 6.8; optionally prefer its first series."""
    _positive_design_inputs(module=value_mm)
    if prefer_first_series:
        for candidate in STANDARD_MODULE_SERIES_1:
            if candidate >= value_mm:
                return candidate
    else:
        for candidate in sorted(STANDARD_MODULE_SERIES_1 + STANDARD_MODULE_SERIES_2):
            if candidate >= value_mm:
                return candidate
    raise CylindricalCalculationError("calculated module exceeds table 6.8 range")


def calculate_contact_geometry_factor(*, base_helix_angle_deg: float, working_pressure_angle_deg: float) -> float:
    """Calculate ``Z_H`` from the verified text following formula (6.13)."""
    if not math.isfinite(base_helix_angle_deg) or abs(base_helix_angle_deg) >= 90:
        raise CylindricalCalculationError("base helix angle beta_b must be finite and below 90 degrees")
    if not math.isfinite(working_pressure_angle_deg) or not 0 < working_pressure_angle_deg < 90:
        raise CylindricalCalculationError("working pressure angle alpha_tw must be between 0 and 90 degrees")
    denominator = math.sin(2 * math.radians(working_pressure_angle_deg))
    if denominator <= 0:
        raise CylindricalCalculationError("formula for ZH has a non-positive denominator")
    return math.sqrt(2 * math.cos(math.radians(base_helix_angle_deg)) / denominator)


def calculate_elasticity_factor(*, modulus_1_mpa: float, modulus_2_mpa: float, poisson_ratio: float) -> float:
    """Calculate ``Z_M`` from the verified expression on page 54."""
    _positive_design_inputs(E1=modulus_1_mpa, E2=modulus_2_mpa)
    if not math.isfinite(poisson_ratio) or not 0 <= poisson_ratio < 0.5:
        raise CylindricalCalculationError("Poisson ratio must be in the range [0, 0.5)")
    return math.sqrt(
        (1 / (math.pi * (1 - poisson_ratio**2)))
        * (2 * modulus_1_mpa * modulus_2_mpa / (modulus_1_mpa + modulus_2_mpa))
    )


def calculate_contact_ratio_factor(*, transverse_contact_ratio: float, axial_contact_ratio: float) -> float:
    """Calculate ``Z_epsilon`` using the two verified page-54 branches."""
    _positive_design_inputs(epsilon_alpha=transverse_contact_ratio)
    if not math.isfinite(axial_contact_ratio) or axial_contact_ratio < 0:
        raise CylindricalCalculationError("epsilon_beta must be finite and non-negative")
    if axial_contact_ratio < 0.9:
        core = (4 - transverse_contact_ratio) / 3
        if core <= 0:
            raise CylindricalCalculationError("epsilon_alpha must be below 4 for this Z_epsilon branch")
        return math.sqrt(core)
    return math.sqrt(1 / transverse_contact_ratio)


def calculate_contact_dynamic_load_616(
    *,
    delta_h: float,
    pitch_difference_factor: float,
    velocity_m_s: float,
    center_distance_mm: float,
    ratio: float,
    limit_n_per_mm: float | None = None,
) -> DynamicSpecificLoadResult:
    """Calculate and optionally cap ``w_Hv`` using formula (6.16), page 55."""
    _positive_design_inputs(
        deltaH=delta_h, g0=pitch_difference_factor, velocity=velocity_m_s,
        aw=center_distance_mm, u=ratio,
    )
    uncapped = delta_h * pitch_difference_factor * velocity_m_s * math.sqrt(center_distance_mm / ratio)
    if limit_n_per_mm is None:
        return DynamicSpecificLoadResult(uncapped, uncapped, None, False)
    _positive_design_inputs(wHv_limit=limit_n_per_mm)
    value = min(uncapped, limit_n_per_mm)
    return DynamicSpecificLoadResult(value, uncapped, limit_n_per_mm, value < uncapped)


def calculate_contact_dynamic_factor_615(
    *,
    dynamic_specific_load_n_per_mm: float,
    face_width_mm: float,
    tangential_force_n: float,
    transverse_load_factor: float,
    face_load_factor: float,
) -> float:
    """Calculate ``K_Hv`` using formula (6.15), page 54."""
    _positive_design_inputs(
        wHv=dynamic_specific_load_n_per_mm, bw=face_width_mm, Ft=tangential_force_n,
        KHalpha=transverse_load_factor, KHbeta=face_load_factor,
    )
    return 1 + (
        dynamic_specific_load_n_per_mm * face_width_mm
        / (tangential_force_n * transverse_load_factor * face_load_factor)
    )


def calculate_contact_specific_load_614(
    *,
    tangential_force_n: float,
    face_width_mm: float,
    transverse_load_factor: float,
    face_load_factor: float,
    dynamic_factor: float,
) -> float:
    """Calculate ``w_Ht`` using formula (6.14), page 54."""
    _positive_design_inputs(
        Ft=tangential_force_n, bw=face_width_mm, KHalpha=transverse_load_factor,
        KHbeta=face_load_factor, KHv=dynamic_factor,
    )
    return (
        tangential_force_n / face_width_mm
        * transverse_load_factor * face_load_factor * dynamic_factor
    )


def check_contact_stress_613(
    *,
    geometry_factor: float,
    elasticity_factor: float,
    contact_ratio_factor: float,
    specific_load_n_per_mm: float,
    ratio: float,
    pinion_working_diameter_mm: float,
    allowable_stress_mpa: float,
    internal_gearing: bool,
) -> ContactStressCheckResult:
    """Evaluate contact endurance using formula (6.13), page 53."""
    _positive_design_inputs(
        ZH=geometry_factor, ZM=elasticity_factor, Zepsilon=contact_ratio_factor,
        wHt=specific_load_n_per_mm, dw1=pinion_working_diameter_mm,
        sigmaHP=allowable_stress_mpa,
    )
    span = _design_span(ratio, internal_gearing)
    stress = (
        geometry_factor * elasticity_factor * contact_ratio_factor
        * math.sqrt(specific_load_n_per_mm * span / (pinion_working_diameter_mm * ratio))
    )
    utilization = stress / allowable_stress_mpa
    return ContactStressCheckResult(stress, allowable_stress_mpa, utilization, stress <= allowable_stress_mpa)


def calculate_bending_helix_factor(*, tooth_form: str, helix_angle_deg: float) -> float:
    """Calculate ``Y_beta`` from the verified text following formula (6.17)."""
    normalized = parse_tooth_form(tooth_form)
    if not math.isfinite(helix_angle_deg) or not 0 <= helix_angle_deg < 90:
        raise CylindricalCalculationError("helix angle beta must be in the range [0, 90) degrees")
    if normalized == "spur":
        return 1.0
    value = 1 - helix_angle_deg / 140
    if value <= 0:
        raise CylindricalCalculationError("formula for Y_beta produced a non-positive value")
    return value


def calculate_bending_transverse_factor_619(
    *,
    tooth_form: str,
    axial_contact_ratio: float,
    transverse_contact_ratio: float,
    accuracy_grade: int,
) -> float:
    """Calculate ``K_Falpha`` using formula (6.19), page 56."""
    normalized = parse_tooth_form(tooth_form)
    if not math.isfinite(axial_contact_ratio) or axial_contact_ratio < 0:
        raise CylindricalCalculationError("epsilon_beta must be finite and non-negative")
    _positive_design_inputs(epsilon_alpha=transverse_contact_ratio)
    if isinstance(accuracy_grade, bool) or not isinstance(accuracy_grade, int) or accuracy_grade <= 0:
        raise CylindricalCalculationError("accuracy grade must be a positive whole number")
    if normalized == "spur" or (normalized == "helical" and axial_contact_ratio <= 1):
        return 1.0
    adjusted_grade = min(9, max(5, accuracy_grade))
    return (4 + (transverse_contact_ratio - 1) * (adjusted_grade - 5)) / (4 * transverse_contact_ratio)


def calculate_bending_dynamic_load_621(
    *,
    delta_f: float,
    pitch_difference_factor: float,
    velocity_m_s: float,
    center_distance_mm: float,
    ratio: float,
    limit_n_per_mm: float | None = None,
) -> DynamicSpecificLoadResult:
    """Calculate and optionally cap ``w_Fv`` using formula (6.21), page 56."""
    _positive_design_inputs(
        deltaF=delta_f, g0=pitch_difference_factor, velocity=velocity_m_s,
        aw=center_distance_mm, u=ratio,
    )
    uncapped = delta_f * pitch_difference_factor * velocity_m_s * math.sqrt(center_distance_mm / ratio)
    if limit_n_per_mm is None:
        return DynamicSpecificLoadResult(uncapped, uncapped, None, False)
    _positive_design_inputs(wFv_limit=limit_n_per_mm)
    value = min(uncapped, limit_n_per_mm)
    return DynamicSpecificLoadResult(value, uncapped, limit_n_per_mm, value < uncapped)


def calculate_bending_dynamic_factor_620(
    *,
    dynamic_specific_load_n_per_mm: float,
    face_width_mm: float,
    tangential_force_n: float,
    transverse_load_factor: float,
    face_load_factor: float,
) -> float:
    """Calculate ``K_Fv`` using formula (6.20), page 56."""
    _positive_design_inputs(
        wFv=dynamic_specific_load_n_per_mm, bw=face_width_mm, Ft=tangential_force_n,
        KFalpha=transverse_load_factor, KFbeta=face_load_factor,
    )
    return 1 + (
        dynamic_specific_load_n_per_mm * face_width_mm
        / (tangential_force_n * transverse_load_factor * face_load_factor)
    )


def calculate_bending_specific_load_618(
    *,
    tangential_force_n: float,
    face_width_mm: float,
    transverse_load_factor: float,
    face_load_factor: float,
    dynamic_factor: float,
) -> float:
    """Calculate ``w_Ft`` using formula (6.18), page 56."""
    _positive_design_inputs(
        Ft=tangential_force_n, bw=face_width_mm, KFalpha=transverse_load_factor,
        KFbeta=face_load_factor, KFv=dynamic_factor,
    )
    return (
        tangential_force_n / face_width_mm
        * transverse_load_factor * face_load_factor * dynamic_factor
    )


def check_bending_stress_617(
    *,
    tooth_form_factor: float,
    overlap_factor: float,
    helix_factor: float,
    specific_load_n_per_mm: float,
    module_mm: float,
    allowable_stress_mpa: float,
) -> BendingStressCheckResult:
    """Evaluate bending endurance using formula (6.17), page 56."""
    _positive_design_inputs(
        YF=tooth_form_factor, Yepsilon=overlap_factor, Ybeta=helix_factor,
        wFt=specific_load_n_per_mm, m=module_mm, sigmaFP=allowable_stress_mpa,
    )
    stress = tooth_form_factor * overlap_factor * helix_factor * specific_load_n_per_mm / module_mm
    utilization = stress / allowable_stress_mpa
    return BendingStressCheckResult(stress, allowable_stress_mpa, utilization, stress <= allowable_stress_mpa)


SYMBOL_ALIASES = {
    "z1": "z1", "z₁": "z1",
    "z2": "z2", "z₂": "z2",
    "m": "m",
    "beta": "beta", "β": "beta",
    "x1": "x1", "x₁": "x1",
    "x2": "x2", "x₂": "x2",
    "aw": "aw", "a_w": "aw", "aʷ": "aw",
    "t1": "t1", "t₁": "t1",
    "n": "power", "power": "power",
    "n1": "n1", "n₁": "n1",
    "sigmaf": "sigma_f", "σf": "sigma_f", "σ_f": "sigma_f",
    "sigmah": "sigma_h", "σh": "sigma_h", "σ_h": "sigma_h",
    "t1max": "t1max", "t₁max": "t1max", "t_1max": "t1max",
    "sigmafpmax": "sigma_fpmax", "σfpmax": "sigma_fpmax", "σ_fpmax": "sigma_fpmax",
    "sigmahpmax": "sigma_hpmax", "σhpmax": "sigma_hpmax", "σ_hpmax": "sigma_hpmax",
    "ka": "ka", "kа": "ka",
    "kd": "kd", "kд": "kd",
    "khbeta": "khbeta", "khβ": "khbeta", "k_hbeta": "khbeta", "k_hβ": "khbeta",
    "psi_ba": "psi_ba", "psiba": "psi_ba", "ψba": "psi_ba", "ψ_ba": "psi_ba",
    "psi_bd": "psi_bd", "psibd": "psi_bd", "ψbd": "psi_bd", "ψ_bd": "psi_bd",
    "sigmahp": "sigma_hp", "σhp": "sigma_hp", "σ_hp": "sigma_hp",
    "engagement": "engagement", "зацепление": "engagement",
    "sigmahpprime": "sigma_hp_base", "sigma_hp_prime": "sigma_hp_base", "σ'hp": "sigma_hp_base",
    "khl": "khl", "k_hl": "khl",
    "nh0": "nh0", "n_h0": "nh0",
    "nhe": "nhe", "n_he": "nhe",
    "th": "th", "t_h": "th",
    "life_category": "life_category", "категориядолговечности": "life_category",
    "load_steps": "load_steps", "ступенинагрузки": "load_steps",
    "tooth_form": "tooth_form", "формазубьев": "tooth_form",
    "sigmahp1": "sigma_hp1", "σhp1": "sigma_hp1", "σ_hp1": "sigma_hp1",
    "sigmahp2": "sigma_hp2", "σhp2": "sigma_hp2", "σ_hp2": "sigma_hp2",
    "sigmafpprime": "sigma_fp_base", "sigma_fp_prime": "sigma_fp_base", "σ'fp": "sigma_fp_base",
    "kfl": "kfl", "k_fl": "kfl",
    "nf0": "nf0", "n_f0": "nf0",
    "nfe": "nfe", "n_fe": "nfe",
    "mf": "mf", "m_f": "mf",
    "yf1": "yf1", "y_f1": "yf1",
    "kma": "kma", "k_ma": "kma",
    "km": "km", "k_m": "km",
    "kfbeta": "kfbeta", "kfβ": "kfbeta", "k_fbeta": "kfbeta", "k_fβ": "kfbeta",
    "bw": "bw", "b_w": "bw",
    "epsilonbeta": "epsilon_beta", "epsilon_beta": "epsilon_beta", "εβ": "epsilon_beta", "ε_β": "epsilon_beta",
    "epsilonalpha": "epsilon_alpha", "epsilon_alpha": "epsilon_alpha", "εα": "epsilon_alpha", "ε_α": "epsilon_alpha",
    "sigmafp1": "sigma_fp1", "σfp1": "sigma_fp1", "σ_fp1": "sigma_fp1",
    "zh": "zh", "z_h": "zh",
    "zm": "zm", "z_m": "zm",
    "zepsilon": "zepsilon", "z_epsilon": "zepsilon", "zε": "zepsilon", "z_ε": "zepsilon",
    "khalpha": "khalpha", "khα": "khalpha", "k_halpha": "khalpha", "k_hα": "khalpha",
    "khv": "khv", "k_hv": "khv",
    "wht": "wht", "w_ht": "wht",
    "whv": "whv", "w_hv": "whv",
    "whvlimit": "whv_limit", "w_hv_limit": "whv_limit",
    "deltah": "delta_h", "delta_h": "delta_h", "δh": "delta_h", "δ_h": "delta_h",
    "g0": "g0", "g_0": "g0",
    "v": "velocity", "velocity": "velocity",
    "ft": "ft", "f_t": "ft",
    "dw1": "dw1", "d_w1": "dw1",
    "yepsilon": "yepsilon", "y_epsilon": "yepsilon", "yε": "yepsilon", "y_ε": "yepsilon",
    "ybeta": "ybeta", "y_beta": "ybeta", "yβ": "ybeta", "y_β": "ybeta",
    "kfalpha": "kfalpha", "kfα": "kfalpha", "k_falpha": "kfalpha", "k_fα": "kfalpha",
    "kfv": "kfv", "k_fv": "kfv",
    "wft": "wft", "w_ft": "wft",
    "wfv": "wfv", "w_fv": "wfv",
    "wfvlimit": "wfv_limit", "w_fv_limit": "wfv_limit",
    "deltaf": "delta_f", "delta_f": "delta_f", "δf": "delta_f", "δ_f": "delta_f",
    "accuracygrade": "accuracy_grade", "accuracy_grade": "accuracy_grade", "nprime": "accuracy_grade", "n'": "accuracy_grade",
}


def normalize_symbol(value: str) -> str:
    cleaned = value.strip().casefold().replace(" ", "")
    return SYMBOL_ALIASES.get(cleaned, cleaned)


def parse_number(value: str) -> float:
    cleaned = value.strip().replace(" ", "").replace(",", ".")
    try:
        result = float(cleaned)
    except ValueError as exc:
        raise CylindricalCalculationError(f"cannot parse numeric value {value!r}") from exc
    if not math.isfinite(result):
        raise CylindricalCalculationError(f"numeric value {value!r} must be finite")
    return result


def values_by_symbol(items: Mapping[str, str]) -> dict[str, float]:
    result: dict[str, float] = {}
    for symbol, value in items.items():
        normalized = normalize_symbol(symbol)
        if normalized in result:
            raise CylindricalCalculationError(f"duplicate input symbol {symbol!r}")
        result[normalized] = parse_number(value)
    return result

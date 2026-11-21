"""Calculation-step index for cylindrical gears.

Only expressions checked directly against the supplied page scans are stored
as expressions. Other entries are navigation records and must be verified from
the scan before a future calculation engine may evaluate them.
"""
from __future__ import annotations

from dataclasses import dataclass


@dataclass(frozen=True)
class CalculationReference:
    key: str
    title: str
    reference: str
    first_page: int
    last_page: int
    modes: frozenset[str]
    verification: str = "ocr_reference_only"
    expression: str | None = None

    @property
    def page_label(self) -> str:
        return str(self.first_page) if self.first_page == self.last_page else f"{self.first_page}–{self.last_page}"

    @property
    def action_title(self) -> str:
        return f"{self.title} ({self.reference}, стр. {self.page_label})"


def _ref(key, title, reference, pages, modes, *, verified=False, expression=None):
    first, last = pages if isinstance(pages, tuple) else (pages, pages)
    return CalculationReference(
        key=key,
        title=title,
        reference=reference,
        first_page=first,
        last_page=last,
        modes=frozenset(modes),
        verification="manually_verified" if verified else "ocr_reference_only",
        expression=expression,
    )


CYLINDRICAL_CALCULATION_REFERENCES = (
    _ref(
        "design_center_distance",
        "Определить межосевое расстояние редуктора общего назначения",
        "формула (6.1)",
        44,
        {"design"},
        verified=True,
        expression="a_w = K_a (u ± 1) ∛(T_1 K_Hβ / (u ψ_ba σ_HP²))",
    ),
    _ref(
        "design_pinion_diameter",
        "Определить диаметр шестерни коробки передач или специального редуктора",
        "формула (6.2)",
        46,
        {"design"},
        verified=True,
        expression="d_w1 = K_d ∛(T_1 K_Hβ (u ± 1) / (u ψ_bd σ_HP²))",
    ),
    _ref("contact_allowable", "Определить допускаемое контактное напряжение", "формула (6.3)", 46, {"design", "verification"}, verified=True, expression="σ_HP = σ'_HP K_HL"),
    _ref("contact_life_factor", "Определить коэффициент долговечности", "формула (6.4)", 48, {"design", "verification"}, verified=True, expression="K_HL = ⁶√(N_H0 / N_HE)"),
    _ref("contact_cycles_constant", "Определить число циклов при постоянной нагрузке", "формула (6.5)", 49, {"design", "verification"}, verified=True, expression="N_HE = N_Σ = 60 t_h n"),
    _ref("contact_cycles_spectrum", "Определить эквивалентное число циклов по циклограмме", "формула (6.6)", 49, {"design", "verification"}, verified=True, expression="N_HE = N_Σ Σ[(T_1i/T_1)³ (n_цi/N_Σ)]"),
    _ref("contact_pair_stress", "Определить допускаемое напряжение пары колес", "формула (6.7)", 50, {"design", "verification"}, verified=True, expression="σ_HP = 0,45(σ_HP1 + σ_HP2) ≤ 1,23 σ_HPmin"),
    _ref("contact_material_tables", "Выбрать базовые напряжения и материалы", "таблицы 6.5–6.6", (47, 49), {"design", "verification"}),
    _ref("bending_module", "Определить модуль по изгибной выносливости", "формула (6.8)", 50, {"design"}, verified=True, expression="m = K_ma T_1 (u ± 1) Y_F1 / (a_w b_w σ_FP1)"),
    _ref("bending_allowable", "Определить допускаемое напряжение изгиба", "формула (6.9)", 50, {"design", "verification"}, verified=True, expression="σ_FP = σ'_FP K_FL"),
    _ref("bending_life_factor", "Определить коэффициент долговечности при изгибе", "формула (6.10)", 50, {"design", "verification"}, verified=True, expression="K_FL = ᵐᶠ√(N_F0 / N_FE)"),
    _ref("bending_cycles_spectrum", "Определить эквивалентное число циклов изгиба", "формула (6.11)", 52, {"design", "verification"}, verified=True, expression="N_FE = N_Σ Σ[(T_1i/T_1)^mF (n_цi/N_Σ)]"),
    _ref("bending_minimum_module", "Определить минимальный модуль упрочнённых зубьев", "формула (6.12)", 52, {"design"}, verified=True, expression="m = K_m ∛(T_1 K_Fβ Y_F1 / (z_1² ψ_bd σ_FP1))"),
    _ref("bending_tables", "Выбрать коэффициент формы и стандартный модуль", "таблицы 6.7–6.9", (51, 52), {"design"}),
    _ref(
        "contact_stress",
        "Проверить контактное напряжение",
        "формула (6.13)",
        53,
        {"verification"},
        verified=True,
        expression="σ_H = Z_H Z_M Z_ε √(w_Ht (u ± 1) / (d_w1 u)) ≤ σ_HP",
    ),
    _ref(
        "contact_specific_load",
        "Определить расчётную удельную окружную силу",
        "формула (6.14)",
        54,
        {"verification"},
        verified=True,
        expression="w_Ht = (F_t / b_w) K_Hα K_Hβ K_Hv",
    ),
    _ref(
        "contact_dynamic_factor",
        "Определить коэффициент динамической нагрузки",
        "формула (6.15)",
        54,
        {"verification"},
        verified=True,
        expression="K_Hv = 1 + w_Hv b_w / (F_t K_Hα K_Hβ)",
    ),
    _ref(
        "contact_dynamic_load",
        "Определить удельную динамическую окружную силу",
        "формула (6.16)",
        55,
        {"verification"},
        verified=True,
        expression="w_Hv = δ_H g_0 v √(a_w / u)",
    ),
    _ref(
        "contact_factor_tables",
        "Выбрать коэффициенты контактного расчёта и проверить предел w_Hv",
        "таблицы 6.10–6.14",
        (53, 55),
        {"verification"},
    ),
    _ref(
        "bending_stress",
        "Проверить напряжение изгиба",
        "формула (6.17)",
        56,
        {"verification"},
        verified=True,
        expression="σ_F = Y_F Y_ε Y_β w_Ft / m ≤ σ_FP",
    ),
    _ref(
        "bending_specific_load",
        "Определить расчётную удельную окружную силу при изгибе",
        "формула (6.18)",
        56,
        {"verification"},
        verified=True,
        expression="w_Ft = (F_t / b_w) K_Fα K_Fβ K_Fv",
    ),
    _ref(
        "bending_transverse_factor",
        "Определить коэффициент распределения нагрузки между зубьями",
        "формула (6.19)",
        56,
        {"verification"},
        verified=True,
        expression="K_Fα = [4 + (ε_α - 1)(n' - 5)] / (4 ε_α)",
    ),
    _ref(
        "bending_dynamic_factor",
        "Определить коэффициент динамической нагрузки при изгибе",
        "формула (6.20)",
        56,
        {"verification"},
        verified=True,
        expression="K_Fv = 1 + w_Fv b_w / (F_t K_Fα K_Fβ)",
    ),
    _ref(
        "bending_dynamic_load",
        "Определить удельную динамическую окружную силу при изгибе",
        "формула (6.21)",
        56,
        {"verification"},
        verified=True,
        expression="w_Fv = δ_F g_0 v √(a_w / u)",
    ),
    _ref(
        "maximum_contact",
        "Проверить контактную прочность при максимальной нагрузке",
        "формула (6.22)",
        56,
        {"verification"},
        verified=True,
        expression="σ_Hmax = σ_H √(T_1max / T_1) ≤ σ_HPmax",
    ),
    _ref(
        "maximum_bending",
        "Проверить изгибную прочность при максимальной нагрузке",
        "формула (6.23)",
        57,
        {"verification"},
        verified=True,
        expression="σ_Fmax = σ_F · T_1max / T_1 ≤ σ_FPmax",
    ),
    _ref(
        "geometry",
        "Рассчитать геометрические параметры колес",
        "таблица 6.15",
        57,
        {"design", "verification", "geometry"},
        verified=True,
        expression="a, α_t, α_tw, x_Σ, d_1, d_2, d_w1, d_w2, d_a1, d_a2, d_f1, d_f2",
    ),
    _ref(
        "forces",
        "Определить силы в зацеплении",
        "таблица 6.16",
        58,
        {"design", "verification", "geometry"},
        verified=True,
        expression="T_1; F_t; F_r = F_t·tan(α_tw); F_x = 0 или F_t·tan(β)",
    ),
)


FLAT_BELT_CALCULATION_REFERENCES = (
    _ref("flat_initial", "Выбрать основные параметры и диаметры шкивов", "формулы (1.1)–(1.3), таблицы 1.1–1.2", (5, 6), {"design", "geometry"}),
    _ref("flat_geometry", "Определить межосевое расстояние, длину ремня и угол обхвата", "формулы (1.5)–(1.8)", (6, 8), {"design", "geometry"}),
    _ref("flat_section", "Определить сечение плоского ремня", "формулы (1.10)–(1.18), таблицы 1.3–1.8", (8, 12), {"design"}),
    _ref("flat_forces", "Проверить усилия в плоскоременной передаче", "формулы (1.14)–(1.22)", (12, 13), {"verification"}),
    _ref("flat_life", "Проверить долговечность плоского ремня", "формулы (1.23)–(1.29), таблицы 1.11–1.12", (13, 15), {"verification"}),
)

V_BELT_CALCULATION_REFERENCES = (
    _ref("v_initial", "Выбрать сечение ремня и основные размеры", "формулы (2.1)–(2.6), таблицы 2.1–2.5", (15, 18), {"design", "geometry"}),
    _ref("v_count", "Определить число клиновых или поликлиновых ремней", "формулы (2.7)–(2.18), таблицы 2.6–2.10", (18, 23), {"design"}),
    _ref("v_check", "Выполнить проверочный расчет клиновых ремней", "формулы (2.19)–(2.20)", (23, 24), {"verification"}),
)

TOOTHED_BELT_CALCULATION_REFERENCES = (
    _ref("toothed_design", "Определить модуль, ширину и число зубьев ремня", "формулы (3.1)–(3.7), таблицы 3.1–3.5", (25, 28), {"design", "geometry"}),
    _ref("toothed_strength", "Проверить зубья ремня на прочность", "формулы (3.8)–(3.14), таблица 3.6", (28, 30), {"verification"}),
    _ref("toothed_engagement", "Проверить сохранение зацепления", "формулы (3.15)–(3.18), таблица 3.7", (30, 32), {"verification"}),
)

CHAIN_CALCULATION_REFERENCES = (
    _ref("chain_design", "Выбрать шаг и основные параметры цепи", "формулы (4.1)–(4.2), таблицы 4.1–4.3", (33, 34), {"design", "geometry"}),
    _ref("chain_wear", "Проверить износостойкость шарниров", "формулы (4.3)–(4.5), таблицы 4.4–4.5", (35, 36), {"verification"}),
    _ref("chain_fatigue", "Проверить пластины цепи на усталостную прочность", "формула (4.6)", (36, 37), {"verification"}),
    _ref("chain_safety", "Проверить цепь по запасу прочности", "формулы (4.7)–(4.8)", 37, {"verification"}),
    _ref("sprocket", "Проверить параметры и прочность звездочек", "формулы (4.9)–(4.10), таблицы 4.6–4.7", (38, 42), {"design", "verification", "geometry"}),
)

BEVEL_CALCULATION_REFERENCES = (
    _ref("bevel_design", "Определить проектировочные размеры конической передачи", "формулы (7.1)–(7.5), таблицы 7.1–7.5", (58, 65), {"design"}),
    _ref(
        "bevel_contact",
        "Проверить контактную выносливость",
        "формулы (7.6)–(7.8), таблица 7.6",
        (65, 66),
        {"verification"},
        verified=True,
        expression=(
            "σ_H = Z_H Z_M Z_ε √(F_t K_H √(u²+1)/(0,85 b d_m1 u)) ≤ σ_HP; "
            "K_Hv = 1 + w_Hv/w_Ht; "
            "w_Hv = δ_H g_0 v_m √((R_e−0,5b)/u) ≤ w_Hv max"
        ),
    ),
    _ref("bevel_bending", "Проверить изгибную выносливость", "формулы (7.9)–(7.11)", 67, {"verification"}),
    _ref("bevel_maximum", "Проверить прочность при максимальной нагрузке", "формулы (6.22)–(6.23)", 67, {"verification"}),
    _ref("bevel_geometry", "Рассчитать геометрию конических колес", "таблица 7.7", (67, 68), {"design", "verification", "geometry"}),
    _ref("bevel_forces", "Определить радиальные и осевые силы", "рисунки и формулы главы 7", (69, 75), {"design", "verification", "geometry"}),
)

WORM_CALCULATION_REFERENCES = (
    _ref("worm_design", "Определить проектировочные параметры червячной передачи", "формулы (8.1)–(8.9), таблицы 8.2–8.6", (76, 78), {"design"}),
    _ref("worm_contact", "Проверить контактную выносливость", "формулы (8.10)–(8.19), таблицы 8.7–8.14", (78, 82), {"verification"}),
    _ref("worm_bending", "Проверить зубья червячного колеса на изгиб", "формула (8.20)", (82, 83), {"verification"}),
    _ref("worm_thermal", "Проверить червячную передачу на теплостойкость", "формулы (8.21)–(8.23), таблица 8.11", (83, 84), {"verification"}),
    _ref("worm_geometry", "Рассчитать геометрию червячной передачи", "таблица 8.15", (84, 85), {"design", "verification", "geometry"}),
)


CALCULATION_ROUTES = {
    "flat_belt": FLAT_BELT_CALCULATION_REFERENCES,
    "v_belt": V_BELT_CALCULATION_REFERENCES,
    "toothed_belt": TOOTHED_BELT_CALCULATION_REFERENCES,
    "chain": CHAIN_CALCULATION_REFERENCES,
    "cylindrical": CYLINDRICAL_CALCULATION_REFERENCES,
    "bevel": BEVEL_CALCULATION_REFERENCES,
    "worm": WORM_CALCULATION_REFERENCES,
}


def calculation_route(transmission_kind: str, calculation_mode: str) -> tuple[CalculationReference, ...]:
    """Return an ordered route without inventing unverified expressions."""
    return tuple(
        item for item in CALCULATION_ROUTES.get(transmission_kind, ())
        if calculation_mode in item.modes
    )

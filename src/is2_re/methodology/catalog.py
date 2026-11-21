"""Explicit topic/page routing for the supplied ``Детали машин`` manual.

This is an index, not a transcription of the book. Most topic text is OCR and
therefore remains advisory. The manually checked cylindrical supplement is
marked separately and may be cited with higher confidence.
"""
from __future__ import annotations

from dataclasses import dataclass


@dataclass(frozen=True)
class MethodologyTopic:
    key: str
    number: int | None
    title: str
    first_page: int
    last_page: int
    transmissions: frozenset[str]
    modes: frozenset[str]
    verification: str = "ocr_with_scans"
    note: str = ""

    @property
    def page_label(self) -> str:
        return str(self.first_page) if self.first_page == self.last_page else f"{self.first_page}–{self.last_page}"

    @property
    def display_title(self) -> str:
        prefix = f"Тема {self.number}. " if self.number is not None else "Дополнение. "
        return prefix + self.title


def _topic(number, title, pages, transmissions, modes, *, verification="ocr_with_scans", note=""):
    first, last = pages if isinstance(pages, tuple) else (pages, pages)
    return MethodologyTopic(
        key=f"topic_{number}" if number is not None else "cylindrical_supplement",
        number=number,
        title=title,
        first_page=first,
        last_page=last,
        transmissions=frozenset(transmissions),
        modes=frozenset(modes),
        verification=verification,
        note=note,
    )


METHODOLOGY_TOPICS = (
    _topic(1, "Проектировочный расчет плоскоременной передачи", (5, 8), {"flat_belt"}, {"design"}),
    _topic(2, "Проектировочный расчет сечения ремня плоскоременной передачи", (8, 12), {"flat_belt"}, {"design", "geometry"}),
    _topic(3, "Проверочный расчет усилий в плоскоременной передаче", (12, 13), {"flat_belt"}, {"verification"}),
    _topic(4, "Проверочный расчет плоскоременной передачи на долговечность", (13, 15), {"flat_belt"}, {"verification"}),
    _topic(5, "Проектировочный расчет клиноременной передачи", (15, 18), {"v_belt"}, {"design", "geometry"}),
    _topic(6, "Расчет числа нормальных клиновых ремней", (18, 23), {"v_belt"}, {"design"}),
    _topic(7, "Расчет числа поликлиновых ремней", (18, 23), {"v_belt"}, {"design"}),
    _topic(8, "Проверочный расчет нормальных и узких клиновых ремней", (23, 24), {"v_belt"}, {"verification"}),
    _topic(9, "Проверочный расчет поликлиновых ремней", (23, 24), {"v_belt"}, {"verification"}),
    _topic(10, "Проектировочный расчет передачи зубчатым ремнем", (25, 28), {"toothed_belt"}, {"design", "geometry"}),
    _topic(11, "Проверка зубьев зубчатого ремня на прочность", (28, 30), {"toothed_belt"}, {"verification"}),
    _topic(12, "Проверка сохранения зацепления зубчатого ремня", 30, {"toothed_belt"}, {"verification"}, note="Вспомогательные страницы 31–32 содержат продолжение геометрии шкивов."),
    _topic(13, "Проектировочный расчет цепной передачи", (33, 34), {"chain"}, {"design", "geometry"}),
    _topic(14, "Проверка цепи на износостойкость шарниров", (35, 36), {"chain"}, {"verification"}),
    _topic(15, "Проверка пластин цепи на усталостную прочность", (36, 37), {"chain"}, {"verification"}),
    _topic(16, "Проектировочный расчет цилиндрической передачи общего назначения", (44, 52), {"cylindrical"}, {"design"}),
    _topic(17, "Проектировочный расчет прямозубой цилиндрической передачи", (44, 52), {"cylindrical"}, {"design"}),
    _topic(18, "Проверка цилиндрической передачи на контактную выносливость", (53, 55), {"cylindrical"}, {"verification"}),
    _topic(19, "Проверка цилиндрической передачи на изгибную выносливость", (56, 58), {"cylindrical"}, {"verification"}, note="Формула (6.23) и продолжение находятся на страницах 57–58."),
    _topic(20, "Проектировочный расчет конической передачи по делительному диаметру", (62, 65), {"bevel"}, {"design"}),
    _topic(21, "Проектировочный расчет конической передачи по конусному расстоянию", (62, 65), {"bevel"}, {"design"}),
    _topic(22, "Проверка конической передачи на контактную выносливость", (65, 66), {"bevel"}, {"verification"}),
    _topic(23, "Проверка конической передачи на изгибную выносливость", 67, {"bevel"}, {"verification"}),
    _topic(24, "Геометрический расчет конической передачи", (67, 75), {"bevel"}, {"geometry"}, note="Страницы 69–75 находятся во вспомогательном указателе."),
    _topic(25, "Проектировочный расчет червячной передачи", (76, 78), {"worm"}, {"design"}),
    _topic(26, "Проверка червячной передачи на контактную выносливость", (78, 82), {"worm"}, {"verification"}),
    _topic(27, "Проверка червячного колеса на изгибную выносливость", (82, 83), {"worm"}, {"verification"}),
    _topic(28, "Расчет червячной передачи на теплостойкость", (83, 84), {"worm"}, {"verification"}),
    _topic(29, "Геометрический расчет червячной передачи", (84, 85), {"worm"}, {"geometry"}),
    _topic(30, "Проверка цепи по запасу прочности", 37, {"chain"}, {"verification"}, note="Вспомогательные страницы 38–42 продолжают расчет звездочек."),
    _topic(
        None,
        "Геометрический расчет и силы в цилиндрической передаче",
        (57, 58),
        {"cylindrical"},
        {"design", "verification", "geometry"},
        verification="manually_verified",
        note="Вручную восстановлены формулы (6.1)–(6.23), таблицы 6.15 и 6.16.",
    ),
)


def recommend_topics(transmission_kind: str, calculation_mode: str) -> tuple[MethodologyTopic, ...]:
    """Return stable, explicitly curated matches; never keyword-guess pages."""
    return tuple(
        topic for topic in METHODOLOGY_TOPICS
        if transmission_kind in topic.transmissions and calculation_mode in topic.modes
    )


def recommendation_text(transmission_kind: str, calculation_mode: str) -> str:
    matches = recommend_topics(transmission_kind, calculation_mode)
    if not matches:
        return "Для выбранного сочетания пока нет закрепленного раздела методички."
    return "\n".join(
        f"{topic.display_title} — стр. {topic.page_label}"
        + (" — проверено вручную" if topic.verification == "manually_verified" else " — OCR, сверить со сканом")
        for topic in matches
    )

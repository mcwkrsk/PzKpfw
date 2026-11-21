"""Machine-readable feature/unknown-data inventory for a concrete project.

This is a source-coverage and evidence-readiness report, *not* native parity.
"""
from __future__ import annotations
from collections import Counter

from .document import ProjectDocument

CAPABILITIES = (
    ('xml_roundtrip', 'implemented_tested_locally', 'Сохранение и повторная загрузка ProjectDocument с проверкой'),
    ('decomposition_tree', 'implemented_tested_locally', 'Цепочки композиции и расположения type=2/3'),
    ('decomposition_conversions', 'partially_reconstructed', 'Наблюдались значения native setter и число дочерних элементов; имена и codeStructure неизвестны'),
    ('matrix_serialization', 'partially_reconstructed', 'AElement type=4; e1 — действие, e2 — параметр, char/power'),
    ('specifications_A_B_D_D1_D2', 'experimental', 'Независимые представления; формулы и соответствие печатной форме оригинала не проверены'),
    ('native_codes', 'unknown', 'Нативные правила getCode, codeStructure и getStructureSymbols восстановлены не полностью'),
    ('native_subject_operations', 'unknown', 'Полная семантика SubjectOperationsStructure недоступна'),
    ('native_qt_plugins', 'not_implemented', 'Python/Tk не загружает проприетарный ABI Qt IsModule'),
    ('native_matrix_visual_rules', 'unknown', 'Специальные структурные символы и алгоритм интерфейса не подтверждены'),
    ('native_graphical_renderer', 'not_implemented', 'Геометрия и компоновка исходного Qt QPainter не воспроизведены'),
    ('windows_acceptance', 'not_tested', 'Нет проверки открытия, сохранения и повторного открытия в оригинальной ИС.exe'),
)


def feature_audit(doc: ProjectDocument) -> dict[str, object]:
    matrix = doc.root.find('models/primaryModel/matrix')
    records = [n for n in matrix if isinstance(n.tag, str)] if matrix is not None else []
    char_counts = Counter()
    unknown = []
    for index, node in enumerate(records):
        try:
            symbol = chr(int(node.get('char', '')))
        except (ValueError, OverflowError):
            symbol = '?'
        char_counts[symbol] += 1
        if (node.tag != 'AElement' or node.get('type') != '4' or symbol not in ('*', '+', '.') or
                node.get('power') is None):
            unknown.append({'index': index, 'tag': node.tag, 'type': node.get('type'),
                            'character': symbol, 'reason': 'unrecognised or not safely editable'})
    conversion_candidates = [n.get('id', '') for n in doc.actions
                             if n.get('type') == '0' and not doc.composition_children(n.get('id', ''))]
    missing_data = [
        {'item': 'native_populated_matrix', 'needed': 'Файл .is2, сохранённый в ИС-2 и содержащий *, +, ., несколько значений power и специальные структурные символы',
         'observed_in_project': bool(records)},
        {'item': 'native_decomposition_golden_samples', 'needed': 'Файлы до и после преобразований в IS.exe для последовательности, альтернативы, цикла и элементарных действий',
         'observed_in_project': False},
        {'item': 'native_code_generation', 'needed': 'XML до и после с ID, уровнями, символами, кодами и перестановкой; результат декомпилятора C++',
         'observed_in_project': False},
        {'item': 'native_specification_reference', 'needed': 'Выводы всех исходных форм (HTML/PDF/скриншоты) для одного и того же проекта',
         'observed_in_project': False},
        {'item': 'native_gui_behavior', 'needed': 'Сеанс оригинального Qt-приложения для сравнения графики, перетаскивания и печати',
         'observed_in_project': False},
        {'item': 'windows_native_acceptance', 'needed': 'IS.exe открывает изменённый .is2, сохраняет его, после чего PzKpfw открывает полученный файл',
         'observed_in_project': False},
    ]
    return {
        'project': doc.root.get('name', ''), 'action_count': len(doc.actions),
        'parameter_count': len(doc.params_node.findall('param')),
        'action_type_counts': dict(Counter(n.get('type', '?') for n in doc.actions)),
        'elementary_conversion_candidates': conversion_candidates,
        'matrix_record_count': len(records), 'matrix_char_counts': dict(char_counts),
        'matrix_opaque_or_special_records': unknown,
        'validation_issues': doc.validate(deep=True),
        'capabilities': [dict(id=k, status=s, evidence=e) for k, s, e in CAPABILITIES],
        'missing_reference_data': missing_data,
        'original_runtime_acceptance': 'NOT_TESTED',
        'native_source_parity': 'NOT_ESTABLISHED',
    }

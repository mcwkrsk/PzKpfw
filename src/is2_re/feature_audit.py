"""Machine-readable feature/unknown-data inventory for a concrete project.

This is a source-coverage and evidence-readiness report, *not* native parity.
"""
from __future__ import annotations
from collections import Counter

from .document import ProjectDocument

CAPABILITIES = (
    ('xml_roundtrip', 'implemented_tested_locally', 'ProjectDocument round-trip + validation'),
    ('decomposition_tree', 'implemented_tested_locally', 'type=2/3 composition and arrangement chains'),
    ('decomposition_conversions', 'partially_reconstructed', 'native setter values and child counts observed; naming/codeStructure unknown'),
    ('matrix_serialization', 'partially_reconstructed', 'AElement type=4; e1 action, e2 parameter, char/power'),
    ('specifications_A_B_D_D1_D2', 'experimental', 'independent projections; native formulas/print parity unverified'),
    ('native_codes', 'unknown', 'getCode, codeStructure, getStructureSymbols native rules incomplete'),
    ('native_subject_operations', 'unknown', 'full SubjectOperationsStructure semantics unavailable'),
    ('native_qt_plugins', 'not_implemented', 'Python/Tk cannot load proprietary Qt IsModule ABI'),
    ('native_matrix_visual_rules', 'unknown', 'special structural symbols and UI algorithm unconfirmed'),
    ('native_graphical_renderer', 'not_implemented', 'original Qt QPainter geometry/layout not reproduced'),
    ('windows_acceptance', 'not_tested', 'no original IS.exe live open-save-reopen comparison'),
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
        {'item': 'native_populated_matrix', 'needed': 'IS-2-saved .is2 containing *, +, ., multiple powers, special structural symbols',
         'observed_in_project': bool(records)},
        {'item': 'native_decomposition_golden_samples', 'needed': 'Before/after IS.exe files for sequence, alternative, iteration and elementary conversions',
         'observed_in_project': False},
        {'item': 'native_code_generation', 'needed': 'Before/after XML with IDs, levels, symbols, codes and rearrangement; C++ decompiler output',
         'observed_in_project': False},
        {'item': 'native_specification_reference', 'needed': 'All original form outputs (HTML/PDF/screenshots) from same source project',
         'observed_in_project': False},
        {'item': 'native_gui_behavior', 'needed': 'Original Qt application session for visual/drag/drop/print comparison',
         'observed_in_project': False},
        {'item': 'windows_native_acceptance', 'needed': 'IS.exe opens edited .is2, saves, then fork opens native output',
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

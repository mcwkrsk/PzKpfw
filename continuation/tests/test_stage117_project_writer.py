import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def test_project_writer_audit_snapshot_is_complete():
    audit = json.loads((ROOT / 'analysis/project_writer/project_writer_audit.json').read_text(encoding='utf-8'))
    assert audit['audit'] == 'stage117-is2-project-writer-and-range-persistence'
    assert audit['status'] == 'PASS'
    assert audit['passed'] == audit['total'] == 21
    assert audit['sha256'] == 'ed526d51da184685dab5ddd89eae0e486b37001ed5781e623cb25f9166410dc2'
    assert audit['range_persistence']['source_field'] == 'AIEBinaryLinkPrivate+0x2C'
    assert audit['range_persistence']['xml_attribute'] == 'range'
    assert audit['range_roundtrip']['status'] == 'static read/write path established; runtime round-trip not executed'


def test_project_writer_report_preserves_evidence_boundary():
    report = (ROOT / 'docs/37_stage1_17_is2_project_writer_and_range_persistence.md').read_text(encoding='utf-8')
    assert '0x0040B9D0' in report
    assert 'QIODevice::WriteOnly' in report
    assert 'UTF-8' in report
    assert 'AIEBinaryLinkPrivate+0x2C' in report
    assert '0x00406380' in report
    assert 'values `1` and `99`' in report
    assert 'No original Windows save operation was run' in report


def test_sample_cs_coverage_snapshot_has_no_link_golden_project():
    coverage = json.loads((ROOT / 'analysis/project_writer/sample_cs_coverage.json').read_text(encoding='utf-8'))
    assert len(coverage['projects']) == 3
    assert all(row['cs_elemets_count'] == 0 for row in coverage['projects'])
    assert all(row['cs_links_count'] == 0 for row in coverage['projects'])
    assert all(row['spz_AElement_count'] == 1 for row in coverage['projects'])

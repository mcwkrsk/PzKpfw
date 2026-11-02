import json
import math
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SNAPSHOT = ROOT / "analysis" / "plugins" / "is_module_abi.json"
EXPECTED = {
    "PM_auto.dll": ("PrimaryModelAuto", "PrimaryModelAuto", 0x174, "0x10002850", "0x1005795c", False),
    "PM_params.dll": ("SPZAuto", "SPZAuto", 0x4C, "0x10007390", "0x10018d30", False),
    "PM_spec_WEB.dll": ("PM_spec_web", "PM_spec_web", 0x64, "0x10006450", "0x1000c8e4", False),
    "PM_matrix_web.dll": ("PM_matrix_web", "PM_matrix_web", 0x60, "0x100028f0", "0x10008798", True),
    "Model_Visualiser.dll": ("Test Module", "Model Visualizer", 0x64, "0x10009d20", "0x1000e5a8", False),
}


def test_is_module_snapshot_has_five_plugins_and_pinned_images():
    data = json.loads(SNAPSHOT.read_text(encoding="utf-8"))
    assert data["static_only"] is True
    assert data["binary_count"] == 5
    assert {item["binary"] for item in data["binaries"]} == set(EXPECTED)
    for item in data["binaries"]:
        assert len(item["sha256"]) == 64
        assert item["module_object_size"] == 0x1C
        assert len(item["slots"]) == 3
        assert item["slots"][0]["observed"].startswith("single-byte RET")
        assert item["slots"][0]["byte_offset"] == 0
        assert item["slots"][1]["byte_offset"] == 4
        assert item["slots"][2]["byte_offset"] == 8


def test_descriptor_strings_float_and_raw_widget_list_are_consistent():
    data = json.loads(SNAPSHOT.read_text(encoding="utf-8"))
    for item in data["binaries"]:
        first, last, widget_size, factory_va, module_vtable_va, tail_zeroed = EXPECTED[item["binary"]]
        assert item["loadModule_va"] == factory_va
        assert item["is_module_vtable_va"] == module_vtable_va
        assert item["factory_zeroes_full_module_block"] is tail_zeroed
        desc = item["descriptor"]
        assert desc["size_bytes"] == 12
        assert desc["field_0"]["text"] == first
        assert desc["field_8"]["text"] == last
        assert desc["field_4"]["bits"] == "0x3dcccccd"
        assert math.isclose(desc["field_4"]["value"], 0.1, abs_tol=1e-8)
        assert item["widget"]["allocation_size_bytes"] == widget_size
        assert "+0xc" in item["widget"]["list_receiver_expression"]
        assert item["module_fields"]["0x0c"]["initial_value_source"] == "?shared_null@QListData@@2UData@1@B"
        assert item["module_fields"]["0x08"]["initial_value_source"] == "?shared_null@QMapDataBase@@2U1@B"
        init = item["factory_initialization"]
        assert init["writes_derived_vftable_at_0x00"] is True
        assert init["stores_qmap_pointer_at_0x08"] is True
        assert init["stores_qlist_pointer_at_0x0c"] is True
        assert init["descriptor_pointer_0x04_written_by_host_later"] is True
        tail = item["module_fields"]["0x10-0x1b"]
        assert tail["description"] == "opaque; no field semantics assigned"
        assert tail["zeroed_by_factory"] is item["factory_zeroes_full_module_block"]
        assert item["is_module_vtable_va"].startswith("0x100")


def test_only_matrix_factory_zeroes_the_full_module_allocation():
    data = json.loads(SNAPSHOT.read_text(encoding="utf-8"))
    zeroed = {item["binary"] for item in data["binaries"]
              if item["factory_zeroes_full_module_block"]}
    assert zeroed == {"PM_matrix_web.dll"}

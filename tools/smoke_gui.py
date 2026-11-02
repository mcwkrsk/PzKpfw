#!/usr/bin/env python3
"""Tk desktop smoke test; run under xvfb-run on headless Linux."""
from __future__ import annotations

import argparse
import tkinter as tk
from tkinter import ttk
from pathlib import Path
import tempfile
from unittest.mock import patch
import xml.etree.ElementTree as ET

from is2_re.document import ProjectDocument
from is2_re.gui import Is2Studio
from is2_re.graph import build_relationship_graph
from is2_re.view_state import load_view_state, sidecar_path
from is2_re.repair import link_integrity_report


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("project", nargs="?", type=Path,
                        default=Path(__file__).resolve().parents[1] / "samples" / "kursach_user_supplied_42_actions.is2")
    args = parser.parse_args()
    project = args.project.resolve()
    doc = ProjectDocument.load(project)
    # Add disposable records before the editor establishes its saved-state
    # snapshot. The golden samples intentionally have no dynamic relation rows.
    second_id = doc.dynamic_structure.add_element("PzKpfw GUI smoke element")
    category_id = doc.concept_structure.add_category("PzKpfw GUI smoke category", class_id=1, group=5)
    category_id_2 = doc.concept_structure.add_category("PzKpfw GUI smoke category 2", class_id=2, group=7)
    cs_link_id = doc.concept_structure.add_link(
        2, e1=category_id, e2=category_id_2, attributes={"vendorSmoke": "initial"}
    )
    spz_index = doc.dynamic_structure.add_spz_link(
        e1="1", e2=second_id, name="PzKpfw GUI smoke relation",
        attributes={"smoke": "yes"},
    )
    content_index = doc.dynamic_structure.add_content_link("1", category_id, char=-1, power=7)
    content_fixture = doc.dynamic_structure.content_records[content_index]
    content_fixture.set("smoke", "yes")
    app = Is2Studio()
    try:
        app.doc = doc
        app.path = project
        app._reset_history(saved=True)
        app.refresh_all()
        app._set_enabled(True)
        app.wait_window = lambda _dialog: None
        app.update_idletasks()
        action_count = sum(1 for _ in doc.actions)
        parameter_count = len(doc.params_node.findall("param"))
        object_count = len(doc.objects_node.findall("object"))
        category_count = len(doc.concept_structure.categories)
        link_count = len(doc.concept_structure.links)
        assert len(app.action_tree.get_children("")) > 0
        assert len(app.diagram_canvas.find_withtag("node")) == action_count * 3
        assert len(app.param_tree.get_children("")) == parameter_count
        assert len(app.object_tree.get_children("")) == object_count
        assert len(app.category_tree.get_children("")) == category_count
        assert len(app.link_tree.get_children("")) == link_count

        # ConceptModel category filtering now includes explicit group navigation.
        app.concept_group_filter.set("7")
        app._refresh_categories()
        assert set(app.category_tree.get_children("")) == {category_id_2}
        app.concept_group_filter.set("Все")
        app._refresh_categories()

        # Advanced custom attributes preserve the native ID and unknown child XML.
        class _JsonDialogResult:
            def __init__(self, result):
                self.result = result
        app.category_tree.selection_set(category_id)
        category_attrs = {k: v for k, v in app.doc.concept_structure.category(category_id).attrib.items() if k != "id"}
        category_attrs["vendorSmoke"] = "edited"
        with patch("is2_re.gui.JsonAttributesDialog", side_effect=lambda *a, **k: _JsonDialogResult(category_attrs)):
            app.edit_category_attributes()
        assert app.doc.concept_structure.category(category_id).get("vendorSmoke") == "edited"
        assert app.history.can_undo
        app.undo(); assert app.doc.concept_structure.category(category_id).get("vendorSmoke") is None
        app.redo(); assert app.doc.concept_structure.category(category_id).get("vendorSmoke") == "edited"
        app.undo()

        app.link_tree.selection_set(cs_link_id)
        link_attrs = {k: v for k, v in app.doc.concept_structure.link(cs_link_id).attrib.items() if k != "id"}
        link_attrs["vendorLinkFlag"] = "gui-edited"
        with patch("is2_re.gui.JsonAttributesDialog", side_effect=lambda *a, **k: _JsonDialogResult(link_attrs)):
            app.edit_concept_link_attributes()
        assert app.doc.concept_structure.link(cs_link_id).get("vendorLinkFlag") == "gui-edited"
        app.undo(); assert app.doc.concept_structure.link(cs_link_id).get("vendorLinkFlag") is None
        app.redo(); assert app.doc.concept_structure.link(cs_link_id).get("vendorLinkFlag") == "gui-edited"
        app.undo()

        # Exercise the 0.7.6 graph relationship editors with disposable in-memory rows:
        # the shipped golden corpus intentionally has no non-empty link/content.
        assert len(app.spz_links_tree.get_children("")) == 1
        assert len(app.content_tree.get_children("")) == 1

        # Recovered PrimaryModel param/@o references are explicit graph dependencies.
        first_object = app.object_tree.get_children("")[0]
        object_count_before = len(app.doc.objects_node.findall("object"))
        object_refs_before = app.doc.parameter_object_references(first_object)
        app.object_tree.selection_set(first_object)
        with patch("is2_re.gui.messagebox.askyesno", return_value=True) as confirm:
            app.delete_object()
        confirm.assert_called_once()
        assert len(app.doc.objects_node.findall("object")) == object_count_before - 1
        assert all(app.doc.parameter(param_id).get("o") is None for param_id, _ in object_refs_before)
        app.undo()
        assert len(app.doc.objects_node.findall("object")) == object_count_before
        assert app.doc.parameter_object_references(first_object) == object_refs_before
        app.redo()
        assert len(app.doc.objects_node.findall("object")) == object_count_before - 1
        app.undo()
        first_parameter = app.param_tree.get_children("")[0]
        parameter_count_before = len(app.doc.params_node.findall("param"))
        app.param_tree.selection_set(first_parameter)
        with patch("is2_re.gui.messagebox.showwarning") as warning, patch("is2_re.gui.messagebox.askyesno") as confirm:
            app.delete_parameter()
        warning.assert_called_once()
        confirm.assert_not_called()
        assert len(app.doc.params_node.findall("param")) == parameter_count_before

        app._refresh_graph()
        graph_report = build_relationship_graph(doc)
        assert graph_report["summary"]["relations_by_kind"] == {
            "ae_content_link": 1, "aie_binary_link": 1, "parameter_object": len(doc.parameter_object_references()),
            "scbinarylink": 1,
        }
        assert graph_report["summary"]["relation_node_count"] == 3 + len(doc.parameter_object_references())
        assert graph_report["summary"]["endpoint_count"] == 6 + 2 * len(doc.parameter_object_references())
        assert len(app.graph_canvas.find_withtag("graph-node")) == 3 * len(graph_report["nodes"])
        app.spz_links_tree.selection_set("0")
        app._show_spz_link_detail()
        assert 'smoke="yes"' in app.spz_link_detail.get("1.0", "end")
        app.content_tree.selection_set("0")
        app._show_content_detail()
        assert 'power="7"' in app.content_detail.get("1.0", "end")

        # Exercise the actual endpoint editor callback (dialog result is
        # injected so the smoke test remains unattended).
        class _DialogResult:
            def __init__(self, result):
                self.result = result

        app.spz_links_tree.selection_set("0")
        with patch("is2_re.gui.RecordDialog", side_effect=lambda *a, **k: _DialogResult({
            "e1": second_id, "e2": second_id, "e3": "1"
        })):
            app.edit_spz_link()
        assert app.doc.dynamic_structure.links[0].get("e1") == second_id
        assert app.history.can_undo and app.dirty
        app.undo()
        assert app.doc.dynamic_structure.links[0].get("e1") == "1"
        assert not app.dirty
        app.redo()
        assert app.doc.dynamic_structure.links[0].get("e1") == second_id
        assert app.dirty
        app.undo()
        assert app.doc.dynamic_structure.links[0].get("e3") == "0"

        # Exercise the actual char/power editor callback too.
        app.content_tree.selection_set("0")
        with patch("is2_re.gui.RecordDialog", side_effect=lambda *a, **k: _DialogResult({
            "e1": "2", "e2": category_id, "char": "-2", "power": "8"
        })):
            app.edit_content_record()
        assert app.doc.dynamic_structure.content_records[0].get("e1") == "2"
        assert app.doc.dynamic_structure.content_records[0].get("char") == "-2"
        app.undo()
        assert app.doc.dynamic_structure.content_records[0].get("e1") == "1"
        assert app.doc.dynamic_structure.content_records[0].get("char") == "-1"
        assert not app.dirty
        app.redo()
        assert app.doc.dynamic_structure.content_records[0].get("power") == "8"
        assert app.dirty
        app.undo()

        # Exercise GUI creation of a new AIEBinaryLink, including undo/redo.
        with patch("is2_re.gui.RecordDialog", side_effect=lambda *a, **k: _DialogResult({
            "e1": second_id, "e2": "0", "e3": "0", "name": "GUI-created",
            "type": "0", "status": "0", "formalization": "0", "level": "0",
            "number": "0", "symbol": "0",
        })):
            app.add_spz_link()
        assert len(app.doc.dynamic_structure.links) == 2
        app.undo(); assert len(app.doc.dynamic_structure.links) == 1
        app.redo(); assert len(app.doc.dynamic_structure.links) == 2
        app.undo()
        app.spz_links_tree.selection_set("0")
        with patch("is2_re.gui.messagebox.askyesno", return_value=True):
            app.delete_spz_link()
        assert len(app.doc.dynamic_structure.links) == 0
        app.undo(); assert len(app.doc.dynamic_structure.links) == 1
        app.redo(); assert len(app.doc.dynamic_structure.links) == 0
        app.undo()

        # Exercise GUI creation and deletion of AEContentLink.
        with patch("is2_re.gui.RecordDialog", side_effect=lambda *a, **k: _DialogResult({
            "e1": "1", "e2": category_id, "char": "0", "power": "1",
        })):
            app.add_content_link()
        assert len(app.doc.dynamic_structure.content_records) == 2
        app.undo(); assert len(app.doc.dynamic_structure.content_records) == 1
        app.redo(); assert len(app.doc.dynamic_structure.content_records) == 2
        app.undo()
        app.content_tree.selection_set("0")
        with patch("is2_re.gui.messagebox.askyesno", return_value=True):
            app.delete_content_link()
        assert len(app.doc.dynamic_structure.content_records) == 0
        app.undo(); assert len(app.doc.dynamic_structure.content_records) == 1
        app.redo(); assert len(app.doc.dynamic_structure.content_records) == 0
        app.undo()
        doc = app.doc
        assert not doc.validate(), doc.validate()

        # Exercise direct graph CRUD, node dragging, zoom and history timeline.
        app.notebook.select(app.graph_page)
        app.update()
        app.graph_filter_var.set("Все")
        app.graph_search_var.set("")
        app._refresh_graph()
        before_layout = app.graph_positions["action:1"]
        rect_id = app.graph_item_ids["action:1"]
        gx1, gy1, gx2, gy2 = app.graph_canvas.coords(rect_id)
        app.graph_canvas.event_generate("<ButtonPress-1>", x=int((gx1 + gx2) / 2), y=int((gy1 + gy2) / 2))
        app.graph_canvas.event_generate("<B1-Motion>", x=int((gx1 + gx2) / 2 + 36), y=int((gy1 + gy2) / 2 + 18), state=0x100)
        app.graph_canvas.event_generate("<ButtonRelease-1>", x=int((gx1 + gx2) / 2 + 36), y=int((gy1 + gy2) / 2 + 18))
        app.update()
        assert app.graph_positions["action:1"] != before_layout
        snapshot_before_zoom = app._document_snapshot()
        app._graph_zoom_step(1.25)
        assert app.graph_zoom == 1.25 and app._document_snapshot() == snapshot_before_zoom
        app._graph_fit()
        assert 0.5 <= app.graph_zoom <= 2.5

        # The layout groups the three relation families in separate columns,
        # and preferences persist in a sidecar without changing the .is2 XML.
        relation_x = {}
        for node in build_relationship_graph(app.doc)["nodes"]:
            if node.get("kind") == "relation":
                relation_x[node["relation_kind"]] = app.graph_positions[node["key"]][0]
        assert len(set(relation_x.values())) == 4
        with tempfile.TemporaryDirectory(prefix="pzkpfw-074-view-") as view_dir:
            view_project = Path(view_dir) / "view-test.is2"
            view_project.write_bytes(app.doc.to_bytes(pretty=True))
            app.path = view_project
            before_layout_xml = app._document_snapshot()
            app._graph_auto_layout()
            assert app._document_snapshot() == before_layout_xml
            sidecar = sidecar_path(view_project)
            assert sidecar.is_file()
            state = load_view_state(view_project, valid_keys=set(app.graph_positions))
            assert len(state["positions"]) == len(app.graph_positions)
            assert state["active_tab"] == app.notebook.index(app.notebook.select())
            assert state["window_geometry"]
            saved_positions = dict(app.graph_positions)
            app.graph_positions.clear(); app.graph_zoom = 1.0
            warning = app._load_graph_view_state(view_project)
            assert warning is None
            assert app.graph_positions == saved_positions
            app._restore_editor_state()
            assert app.graph_filter_var.get() == state["graph_filter"]
            app.path = project

        # PrimaryModel parameter/object bindings are first-class graph links.
        unassigned_parameter = next(
            n.get("id") for n in app.doc.params_node.findall("param") if n.get("o") in (None, "", "0")
        )
        app.param_tree.selection_set(unassigned_parameter)
        with patch("is2_re.gui.RecordDialog", side_effect=lambda *a, **k: _DialogResult({"object_id": "1"})):
            app.assign_parameter_object()
        assert app.doc.parameter(unassigned_parameter).get("o") == "1"
        app.undo(); assert app.doc.parameter(unassigned_parameter).get("o") is None
        app.redo(); assert app.doc.parameter(unassigned_parameter).get("o") == "1"
        app.undo()

        pm_relation_key = next(
            node["key"] for node in build_relationship_graph(app.doc)["nodes"]
            if node.get("relation_kind") == "parameter_object"
        )
        app._graph_select_node(pm_relation_key)
        parameter_id = app.graph_nodes_by_key[pm_relation_key]["attributes"]["parameter_id"]
        with patch("is2_re.gui.RecordDialog", side_effect=lambda *a, **k: _DialogResult({"object_id": "2"})):
            app.graph_edit_relation()
        assert app.doc.parameter(parameter_id).get("o") == "2"
        app.undo(); assert app.doc.parameter(parameter_id).get("o") == "1"
        app.redo(); assert app.doc.parameter(parameter_id).get("o") == "2"
        with patch("is2_re.gui.messagebox.askyesno", return_value=True):
            app.graph_delete_relation()
        assert app.doc.parameter(parameter_id).get("o") is None
        app.undo(); assert app.doc.parameter(parameter_id).get("o") == "2"
        app.undo()

        # Create, edit and delete an AIEBinaryLink from the graph workspace.
        app.graph_new_kind.set("AIEBinaryLink (spz)")
        with patch("is2_re.gui.RecordDialog", side_effect=lambda *a, **k: _DialogResult({
            "e1": second_id, "e2": "0", "e3": "0", "name": "Graph-created",
            "type": "0", "status": "0", "formalization": "0", "level": "0",
            "number": "0", "symbol": "0",
        })):
            app.graph_add_relation()
        graph_aie_key = f"relation:aie_binary_link:{len(app.doc.dynamic_structure.links)-1}"
        assert graph_aie_key in app.graph_nodes_by_key
        app._graph_select_node(graph_aie_key)
        with patch("is2_re.gui.RecordDialog", side_effect=lambda *a, **k: _DialogResult({
            "e1": second_id, "e2": "0", "e3": "0", "name": "Graph-edited",
            "type": "0", "status": "0", "formalization": "0", "level": "0",
            "number": "0", "symbol": "0",
        })):
            app.graph_edit_relation()
        assert app.doc.dynamic_structure.links[-1].get("name") == "Graph-edited"
        app.undo(); assert app.doc.dynamic_structure.links[-1].get("name") == "Graph-created"
        app.redo(); assert app.doc.dynamic_structure.links[-1].get("name") == "Graph-edited"
        with patch("is2_re.gui.messagebox.askyesno", return_value=True):
            app.graph_delete_relation()
        assert len(app.doc.dynamic_structure.links) == 1
        app.undo(); assert len(app.doc.dynamic_structure.links) == 2
        app.redo(); assert len(app.doc.dynamic_structure.links) == 1
        app.undo()

        # Create and change SCBinaryLink from the graph; all type-specific slot rules still apply.
        app.graph_new_kind.set("SCBinaryLink (cs)")
        with patch("is2_re.gui.RecordDialog", side_effect=lambda *a, **k: _DialogResult({
            "type": "2", "e1": category_id, "e2": category_id_2, "e3": "0", "name": "Graph cs link", "range": "99",
        })):
            app.graph_add_relation()
        graph_sc_key = app.graph_selected_key
        assert graph_sc_key in app.graph_nodes_by_key
        app._graph_select_node(graph_sc_key)
        with patch("is2_re.gui.RecordDialog", side_effect=lambda *a, **k: _DialogResult({
            "type": "2", "e1": category_id, "e2": category_id_2, "e3": "0", "name": "Graph cs edited", "range": "98",
        })):
            app.graph_edit_relation()
        sc_id = str(app.graph_nodes_by_key[graph_sc_key]["attributes"]["id"])
        assert app.doc.concept_structure.link(sc_id).get("name") == "Graph cs edited"
        with patch("is2_re.gui.messagebox.askyesno", return_value=True):
            app.graph_delete_relation()
        assert all(n.get("id") != sc_id for n in app.doc.concept_structure.links)
        app.undo(); assert any(n.get("id") == sc_id for n in app.doc.concept_structure.links)

        # Create, edit and delete AEContentLink directly from the graph workspace.
        app.graph_new_kind.set("AEContentLink (content)")
        with patch("is2_re.gui.RecordDialog", side_effect=lambda *a, **k: _DialogResult({
            "e1": "2", "e2": category_id_2, "char": "3", "power": "4",
        })):
            app.graph_add_relation()
        graph_content_key = app.graph_selected_key
        assert graph_content_key in app.graph_nodes_by_key
        graph_content_index = int(app.graph_nodes_by_key[graph_content_key]["record_index"])
        assert app.doc.dynamic_structure.content_records[graph_content_index].get("char") == "3"
        app._graph_select_node(graph_content_key)
        with patch("is2_re.gui.RecordDialog", side_effect=lambda *a, **k: _DialogResult({
            "e1": "2", "e2": category_id_2, "char": "4", "power": "5",
        })):
            app.graph_edit_relation()
        assert app.doc.dynamic_structure.content_records[graph_content_index].get("power") == "5"
        app.undo()
        assert app.doc.dynamic_structure.content_records[graph_content_index].get("power") == "4"
        app.redo()
        with patch("is2_re.gui.messagebox.askyesno", return_value=True):
            app.graph_delete_relation()
        assert len(app.doc.dynamic_structure.content_records) == 1
        app.undo()
        assert len(app.doc.dynamic_structure.content_records) == 2
        app.redo()
        assert len(app.doc.dynamic_structure.content_records) == 1
        app.undo()

        # Grouped ConceptModel edits become one atomic undo entry.
        app.notebook.select(app.concept_page)
        app.category_tree.selection_set(category_id, category_id_2)
        old_group = app.doc.concept_structure.category(category_id).get("group")
        with patch("is2_re.gui.RecordDialog", side_effect=lambda *a, **k: _DialogResult({"group": "12", "start_number": "20"})):
            app.bulk_edit_categories()
        assert app.doc.concept_structure.category(category_id).get("group") == "12"
        assert app.doc.concept_structure.category(category_id_2).get("number") == "21"
        assert "Групповое редактирование" in app.history.undo_label
        app.undo()
        assert app.doc.concept_structure.category(category_id).get("group") == old_group

        # The history window exposes navigation to selected history boundaries.
        original_project_name = app.doc.root.get("name")
        app.doc.update_project_metadata(name="History state 1")
        app._mark_dirty("History state 1")
        app.doc.update_project_metadata(info="History state 2")
        app._mark_dirty("History state 2")
        app.doc.update_project_metadata(name="History state 3")
        app._mark_dirty("History state 3")
        app.show_history(); app.update_idletasks()
        assert app.history_tree is not None and len(app.history_tree.get_children()) > 0
        assert app.history_journal_tree is not None and len(app.history_journal_tree.get_children()) > 0
        app.history_tree.selection_set("undo:2")
        app._jump_history_selection()
        assert app.doc.root.get("name") == "History state 1"
        assert app.doc.root.get("info") in (None, "")
        app.history_window.destroy(); app.update_idletasks()
        app.show_dependency_audit(); app.update_idletasks()
        audit_windows = [child for child in app.winfo_children() if isinstance(child, tk.Toplevel) and child.title() == "Аудит зависимостей проекта"]
        assert audit_windows
        audit_windows[-1].destroy(); app.update_idletasks()

        # Exercise graph filtering and double-click navigation to a relation row.
        app.graph_filter_var.set("AIEBinaryLink (spz)")
        app.graph_search_var.set(second_id)
        app._refresh_graph()
        graph_visible = build_relationship_graph(app.doc)
        target_relation_key = "relation:aie_binary_link:0"
        assert target_relation_key in app.graph_nodes_by_key
        assert app.graph_nodes_by_key[target_relation_key]["relation_kind"] == "aie_binary_link"
        app.notebook.select(app.graph_page)
        app.update()
        graph_items = app.graph_canvas.find_withtag(f"graph-key:{target_relation_key}")
        assert graph_items, "selected graph relationship must have a visible canvas item"
        app._graph_select_node(target_relation_key)
        app._navigate_graph_node(app.graph_nodes_by_key[target_relation_key])
        app.update()
        assert app.notebook.select() == str(app.other_page)
        assert app.dynamic_tabs.select() == str(app.spz_links_page)
        assert app.spz_links_tree.selection() == ("0",)
        app._reset_graph_filter()

        # Exercise batched repair: two different typed endpoints, one Undo entry.
        app.doc.dynamic_structure.links[0].set("e2", "99999")
        app.doc.dynamic_structure.content_records[0].set("e2", "99998")
        app._mark_dirty("Smoke: созданы два повреждённых endpoint-а")
        integrity = link_integrity_report(app.doc)
        assert integrity["summary"]["dangling_count"] == 2
        app.show_link_repair_dialog(); app.update_idletasks()
        repair_windows = [child for child in app.winfo_children() if isinstance(child, tk.Toplevel) and child.title() == "Диагностика и пакетное восстановление ссылок"]
        assert repair_windows
        repair_windows[-1].destroy(); app.update_idletasks()
        repair_report = app._commit_link_repairs_batch({
            "aie_binary_link:0:e2": second_id,
            "ae_content_link:0:e2": category_id,
        }, [])
        assert repair_report["summary"]["applied_count"] == 2
        assert not app.doc.validate(deep=True)
        assert app.doc.dynamic_structure.links[0].get("e2") == second_id
        assert app.doc.dynamic_structure.content_records[0].get("e2") == category_id
        assert app.history.undo_label.startswith("Пакет восстановления ссылок")
        print("GUI_BATCH_TYPED_LINK_REPAIR_UNDO_REDO_PASS")
        app.undo()
        assert app.doc.dynamic_structure.links[0].get("e2") == "99999"
        assert app.doc.dynamic_structure.content_records[0].get("e2") == "99998"
        app.redo()
        assert app.doc.dynamic_structure.links[0].get("e2") == second_id
        assert app.doc.dynamic_structure.content_records[0].get("e2") == category_id

        # Graph columns collapse/expand, and state persists outside native XML.
        parameter_ident = app.param_tree.get_children("")[0]
        parameter_key = f"parameter:{parameter_ident}"
        assert parameter_key in app.graph_nodes_by_key
        app._toggle_graph_group("parameter")
        assert "parameter" in app.graph_collapsed_groups
        assert not app.graph_canvas.find_withtag(f"graph-key:{parameter_key}")
        assert app.graph_canvas.find_withtag("graph-group:parameter")
        assert app._save_graph_view_state()
        saved_view = load_view_state(project)
        assert saved_view["selections"].get("cg_parameter") == "1"
        app.graph_collapsed_groups.clear()
        app._load_graph_view_state(project)
        assert "parameter" in app.graph_collapsed_groups
        app._refresh_graph()
        assert app.graph_canvas.find_withtag(f"graph-key:{parameter_key}") == ()
        app._expand_all_graph_groups()
        assert not app.graph_collapsed_groups
        assert app.graph_canvas.find_withtag(f"graph-key:{parameter_key}")

        # Establish an explicit savepoint after the graph-editing scenario,
        # then test editor-level dirty/savepoint tracking independently.
        app._reset_history(saved=True)
        doc = app.doc
        # Test editor-level undo/redo and dirty/savepoint tracking on core data.
        original_name = doc.action("1").get("name")
        doc.update_action("1", name="Undo/Redo smoke test")
        app._mark_dirty("Smoke: rename action")
        assert app.history.can_undo and app.dirty
        app.undo()
        assert app.doc.action("1").get("name") == original_name
        assert not app.dirty, "undo back to the saved state must clear the dirty marker"
        assert app.history.can_redo
        app.redo()
        assert app.doc.action("1").get("name") == "Undo/Redo smoke test"
        assert app.dirty and app.history.can_undo
        app.undo()
        assert app.doc.action("1").get("name") == original_name
        doc = app.doc

        # Saving over an existing .is2 creates an exact external backup;
        # restoring it creates a rollback copy of the current project first.
        with tempfile.TemporaryDirectory(prefix="pzkpfw-077-backup-") as backup_dir:
            backup_project = Path(backup_dir) / "backup-smoke.is2"
            original_project_bytes = app.doc.to_bytes()
            expected_backup_name = app.doc.root.get("name")
            backup_project.write_bytes(original_project_bytes)
            app.path = backup_project
            app.doc.update_project_metadata(name="Backup smoke changed")
            app._mark_dirty("Smoke: changed project before backup")
            assert app.save()
            from is2_re.backups import list_project_backups
            backups = list_project_backups(backup_project)
            assert len(backups) == 1 and backups[0].valid_xml
            assert backups[0].path.read_bytes() == original_project_bytes
            assert any(event.action == "save" for event in app.history.journal)
            app.show_backups(); app.update_idletasks()
            backup_windows = [child for child in app.winfo_children() if isinstance(child, tk.Toplevel) and child.title().startswith("Резервные копии")]
            assert backup_windows
            backup_window = backup_windows[-1]
            restore_buttons = []
            for child in backup_window.winfo_children():
                if isinstance(child, ttk.Frame):
                    restore_buttons.extend([button for button in child.winfo_children() if isinstance(button, ttk.Button) and button.cget("text") == "Восстановить выбранную копию"])
            assert restore_buttons
            with patch("is2_re.gui.messagebox.askyesno", return_value=True), patch("is2_re.gui.messagebox.showinfo"):
                restore_buttons[0].invoke()
            assert app.doc.root.get("name") == expected_backup_name
            assert len(list_project_backups(backup_project)) == 2, "restore must preserve a rollback of overwritten state"
            assert not app.dirty
            assert app.history.journal[-1].action == "restore"
            app.path = project

        print("GUI_BACKUP_RESTORE_ROLLBACK_PASS")
        print("GUI_DYNAMIC_CRUD_UNDO_REDO_SMOKE_PASS")
        print("GUI_INTERACTIVE_GRAPH_CRUD_ZOOM_DRAG_HISTORY_PASS")
        print("GUI_RELATIONSHIP_GRAPH_FILTER_NAVIGATION_PASS")
        print("GUI_UNDO_REDO_SMOKE_PASS")
        print(
            f"GUI_SMOKE_PASS file={project.name} actions={action_count} "
            f"parameters={parameter_count} objects={object_count} "
            f"categories={category_count} concept_links={link_count}"
        )
        blank = ProjectDocument.new_empty("GUI smoke blank project", user_name="Smoke")
        assert not blank.validate(), blank.validate()
        app.doc = blank
        app.path = None
        app._reset_history(saved=False)
        app.refresh_all()
        app.update_idletasks()
        assert len(app.action_tree.get_children("")) == 0
        assert len(app.diagram_canvas.find_withtag("node")) == 0
        assert app.diagram_canvas.find_all(), "empty diagram placeholder not rendered"
        app.doc = doc
        app.path = project
        app._reset_history(saved=True)
        app.refresh_all()
        print("GUI_NEW_PROJECT_SMOKE_PASS")
    finally:
        app.destroy()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

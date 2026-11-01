#!/usr/bin/env python3
"""Tk desktop smoke test; run under xvfb-run on headless Linux."""
from __future__ import annotations

import argparse
from pathlib import Path

from is2_re.document import ProjectDocument
from is2_re.gui import Is2Studio


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("project", nargs="?", type=Path,
                        default=Path(__file__).resolve().parents[1] / "samples" / "kursach_user_supplied_42_actions.is2")
    args = parser.parse_args()
    project = args.project.resolve()
    doc = ProjectDocument.load(project)
    app = Is2Studio()
    try:
        app.doc = doc
        app.path = project
        app.refresh_all()
        app._set_enabled(True)
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
        assert not doc.validate(), doc.validate()
        print(
            f"GUI_SMOKE_PASS file={project.name} actions={action_count} "
            f"parameters={parameter_count} objects={object_count} "
            f"categories={category_count} concept_links={link_count}"
        )
        blank = ProjectDocument.new_empty("GUI smoke blank project", user_name="Smoke")
        assert not blank.validate(), blank.validate()
        app.doc = blank
        app.path = None
        app.refresh_all()
        app.update_idletasks()
        assert len(app.action_tree.get_children("")) == 0
        assert len(app.diagram_canvas.find_withtag("node")) == 0
        assert app.diagram_canvas.find_all(), "empty diagram placeholder not rendered"
        app.doc = doc
        app.path = project
        app.refresh_all()
        print("GUI_NEW_PROJECT_SMOKE_PASS")
    finally:
        app.destroy()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

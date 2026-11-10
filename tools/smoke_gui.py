"""GUI smoke and resource-lifecycle test in a graphical session (e.g. Windows)."""
from types import SimpleNamespace
from unittest.mock import patch

from is2_re.coursework import create_course_project
from is2_re.gui import Is2Studio, ReportOptionsDialog
from is2_re.ui_theme import apply_theme


def main():
    app = Is2Studio()
    errors = []
    app.report_callback_exception = lambda *args: errors.append(args)
    try:
        app.doc = create_course_project('Smoke test', 'Root action')
        dialog = ReportOptionsDialog(app, 'Smoke test')
        assert dialog.author.get() == '' and dialog.group.get() == 'ИДБ-24-17'
        dialog._accept()
        assert dialog.result.topic == 'Smoke test' and dialog.result.diagrams
        app.doc.add_action('Child', action_type='0', parent_id='1', symbol='122', level=2, number=1)
        app.doc.add_parameter({'name': 'Test parameter', 'group': '5', 'number': '1'})
        app.refresh_all()
        app._set_enabled(True)
        app.notebook.select(app.action_page)
        app.update()
        app.notebook.select(app.matrix_page)
        app.update()
        app._refresh_matrix()
        app.update()
        matrix = app.matrix_tree
        bbox = matrix.bbox('matrix0', '#3')
        assert bbox
        x, y, width, height = bbox
        matrix.event_generate('<ButtonPress-1>', x=x + width // 2, y=y + height // 2)
        matrix.event_generate('<ButtonRelease-1>', x=x + width // 2, y=y + height // 2)
        assert matrix.selected_column == 2 and matrix.selected_row == 0
        app.update()
        item_count = len(matrix.find_all())
        command_count = len(matrix._tclCommands or ())
        for _ in range(50):
            matrix._draw()
        assert len(matrix.find_all()) == item_count
        assert len(matrix._tclCommands or ()) == command_count
        before_matrix_zoom = app.doc.to_bytes()
        initial = app._matrix_zoom
        app._scale_matrix(1)
        assert app._matrix_zoom > initial
        app._scale_matrix(-1)
        assert app._matrix_zoom == initial and app.doc.to_bytes() == before_matrix_zoom
        app.notebook.select(app.action_page)
        app.update()
        assert app.decomposition_panel.winfo_ismapped()
        app._show_page(app.action_editor_page)
        app.update()
        assert app.notebook.select() == str(app.service_page)
        assert app.advanced_tabs.select() == str(app.action_editor_page)
        assert app.action_tree.winfo_ismapped()
        app._navigate_graph_node({'kind': 'action', 'id': '1'})
        app.update()
        assert app.advanced_tabs.select() == str(app.action_editor_page)
        assert app.action_tree.selection() == ('1',)
        for theme in ('dark', 'light'):
            app.theme_name.set(theme)
            apply_theme(app, theme)
            app.course_panel._draw()
            app.decomposition_panel.refresh()
            app.update()
        # The shared button hints follow the switch and do not accumulate windows.
        hints = app.button_tooltips
        old_enabled = app.tooltips_enabled.get()
        app.tooltips_enabled.set(True)
        button = app.theme_button
        for _ in range(40):
            hints._enter(SimpleNamespace(widget=button))
            assert hints._job is not None
            app.after_cancel(hints._job)
            hints._job = None
            hints._show(button, 'Smoke tooltip')
            assert hints._window is not None
            hints.hide()
            assert hints._window is None and hints._job is None
        app.tooltips_enabled.set(False)
        hints._enter(SimpleNamespace(widget=button))
        assert hints._job is None and hints._window is None
        app.tooltips_enabled.set(old_enabled)
        # Global tooltip control is available from every top-level page.
        for page in (app.course_page, app.action_page, app.param_page, app.object_page,
                     app.forms_page, app.matrix_page, app.service_page):
            app.notebook.select(page)
            app.update()
            assert app.tooltip_button.winfo_ismapped()
        # IS-2-inspired SPD view changes only the presentation and remains editable.
        app.notebook.select(app.course_page)
        app.update()
        spd = app.course_panel
        model_before = app.doc.to_bytes()
        spd._toggle_is2_view()
        app.update()
        assert spd._is2_view and spd._is2_sheet_bar.winfo_ismapped()
        assert len(spd._is2_sheets) >= 2
        sheet = next(label for label, ident in spd._is2_sheets.items() if ident == '1')
        spd._is2_sheet_choice.set(sheet)
        spd._select_is2_sheet()
        assert spd.focus_id == '1'
        app.enter_diagram_focus(spd)
        app.update()
        assert spd._focus_return_bar.winfo_ismapped()
        app.exit_diagram_focus()
        app.update()
        spd._toggle_is2_view()
        assert not spd._is2_view and app.doc.to_bytes() == model_before
        spd._root_scene()
        # Both focus modes keep the same canvas and restore the original layout.
        for page, focus_panel in ((app.course_page, app.course_panel),
                                  (app.action_page, app.decomposition_panel)):
            app.notebook.select(page)
            app.update()
            original_root = tuple(app.pack_slaves())
            original_menu = app.cget('menu')
            canvas = focus_panel.canvas
            zoom = focus_panel.zoom
            view = (canvas.xview(), canvas.yview())
            app.enter_diagram_focus(focus_panel)
            app.update()
            assert app._diagram_focus is focus_panel
            assert focus_panel._focus_return_bar.winfo_ismapped()
            assert not app.tooltip_button.winfo_ismapped()
            if focus_panel is app.course_panel:
                assert len(app.course_panel._focus_panes.panes()) == 1
                before = app.doc.to_bytes()
                initial = (focus_panel.focus_id, focus_panel.depth_limit)
                focus_panel.selected_id = '1'
                focus_panel._focus_scene()
                focus_panel.selected_id = '2'
                focus_panel._focus_scene()
                assert focus_panel.focus_id == '2'
                focus_panel._navigation_back_button.invoke()
                assert focus_panel.focus_id == '1'
                focus_panel._navigation_back_button.invoke()
                assert (focus_panel.focus_id, focus_panel.depth_limit) == initial
                assert app.doc.to_bytes() == before
            else:
                assert focus_panel.tabs.bar.winfo_ismapped()
                assert focus_panel.tabs.tabs()
            app.exit_diagram_focus()
            app.update()
            assert tuple(app.pack_slaves()) == original_root
            assert app.cget('menu') == original_menu
            assert focus_panel.canvas is canvas and focus_panel.zoom == zoom
            assert app.tooltip_button.winfo_ismapped()
            if focus_panel is app.course_panel:
                assert len(app.course_panel._focus_panes.panes()) == 3
                assert app.course_panel._focus_right.winfo_ismapped()
                assert app.course_panel._focus_right.winfo_width() >= 80
        panel = app.decomposition_panel
        assert panel.tabs.tabs()
        assert app.advanced_tabs.tabs()

        # Rebuilding dynamic pages repeatedly must not retain their widgets.
        count = len(panel.tabs.winfo_children())
        for index in range(40):
            app.doc.action('1').set('number', str(index + 10))
            panel.refresh()
            app.update()
            assert len(panel.tabs.winfo_children()) == count

        # Graph rebuilds must not register additional Tcl callback commands.
        app._refresh_graph()
        app.update()
        commands = len(app.graph_canvas._tclCommands or ())
        for _ in range(40):
            app._refresh_graph()
        assert len(app.graph_canvas._tclCommands or ()) == commands
        headings = app.graph_canvas.find_withtag('graph-group-header')
        assert headings
        bounds = app.graph_canvas.bbox(headings[0])
        tags = app.graph_canvas.gettags(headings[0])
        group = next(tag[len('graph-group:'):] for tag in tags if tag.startswith('graph-group:'))
        x = (bounds[0] + bounds[2]) // 2 - app.graph_canvas.canvasx(0)
        y = (bounds[1] + bounds[3]) // 2 - app.graph_canvas.canvasy(0)
        was_collapsed = group in app.graph_collapsed_groups
        app._graph_press(SimpleNamespace(x=x, y=y))
        assert (group in app.graph_collapsed_groups) != was_collapsed

        # Simulate popup display without leaving a menu open in the test.
        with patch('tkinter.Menu.tk_popup'), patch('tkinter.Menu.grab_release'):
            app._show_export_menu()
            menu = app._export_popup
            for _ in range(40): app._show_export_menu()
            assert app._export_popup is menu
            event = SimpleNamespace(x=0, y=0, x_root=10, y_root=10)
            app.course_panel._canvas_context_menu(event)
            menu = app.course_panel._action_context_popup
            for _ in range(40): app.course_panel._canvas_context_menu(event)
            assert app.course_panel._action_context_popup is menu
        app.update()
        if errors:
            raise RuntimeError(f'Tk callback errors: {errors!r}')
    finally:
        app.destroy()
    print('GUI smoke and lifecycle checks passed')


if __name__ == '__main__':
    main()

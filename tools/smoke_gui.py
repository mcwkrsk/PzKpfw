"""Small GUI smoke test; run in a graphical Windows session."""
from is2_re.coursework import create_course_project
from is2_re.gui import Is2Studio
from is2_re.ui_theme import apply_theme

app = Is2Studio()
errors = []
app.report_callback_exception = lambda *args: errors.append(args)
try:
    app.doc = create_course_project('Smoke test', 'Root action')
    app.doc.add_action('Child', action_type='0', parent_id='1', symbol='122', level=2, number=1)
    app.refresh_all()
    app._set_enabled(True)
    app.notebook.select(app.action_page)
    app.update()
    for theme in ('dark', 'light'):
        app.theme_name.set(theme)
        apply_theme(app, theme)
        app.course_panel._draw()
        app.decomposition_panel.refresh()
        app.update()
    assert app.decomposition_panel.tabs.tabs()
    assert app.advanced_tabs.tabs()
    if errors:
        raise RuntimeError(f'Tk callback errors: {errors!r}')
finally:
    app.destroy()
print('GUI smoke test passed')

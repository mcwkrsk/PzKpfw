"""Measure actual matrix redraw and scrolling in a graphical session.

PYTHONPATH=src python tools/benchmark_matrix_gui.py [project.is2]
Without a file a synthetic project is used. Nothing is saved or modified.
"""
import argparse
import gc
import statistics
import time
import tracemalloc
from types import SimpleNamespace

from is2_re.coursework import create_course_project
from is2_re.document import ProjectDocument
from is2_re.gui import Is2Studio


def main():
    parser = argparse.ArgumentParser(description='Matrix GUI performance check')
    parser.add_argument('project', nargs='?')
    args = parser.parse_args()
    doc = ProjectDocument.load(args.project) if args.project else create_course_project('Benchmark', 'Root')
    if not args.project:
        for i in range(260):
            doc.add_action(f'Action {i}', action_type='0', parent_id='1')
        for i in range(100):
            doc.add_parameter({'name': f'Parameter {i}', 'group': '5', 'number': str(i + 1)})
    before = doc.to_bytes()
    app = Is2Studio()
    errors = []
    app.report_callback_exception = lambda *error: errors.append(error)
    try:
        app.geometry('1280x800')
        app.doc = doc
        app.refresh_all()
        app.notebook.select(app.matrix_page)
        app.update()
        app._refresh_matrix()
        app.update()
        canvas = app.matrix_tree
        if canvas.rows and len(canvas.headers) > 2:
            canvas.selected_row, canvas.selected_column = 0, 2
            canvas._schedule()
            app.update()
        for _ in range(10):
            canvas.yview('scroll', 1, 'units'); app.update()
        gc.collect(); tracemalloc.start()
        baseline, _ = tracemalloc.get_traced_memory()
        times = []
        command_counts = []
        for i in range(200):
            start = time.perf_counter()
            canvas.yview('scroll', 1 if i % 2 else -1, 'units')
            app.update()
            times.append((time.perf_counter() - start) * 1000)
            command_counts.append(len(canvas._tclCommands or ()))
        selection_times = []
        if canvas.rows and len(canvas.headers) > 2:
            for i in range(100):
                start = time.perf_counter()
                canvas._press(SimpleNamespace(x=canvas.edges[2] + 2, y=canvas.header_height + (i % 10) * canvas.row_height + 2))
                app.update()
                selection_times.append((time.perf_counter() - start) * 1000)
        gc.collect(); retained, peak = tracemalloc.get_traced_memory()
        times.sort()
        print(f'{len(canvas.rows)} rows, {len(canvas.headers)-2} parameters; 200 scroll updates')
        print(f'median {statistics.median(times):.2f} ms, p95 {times[int(len(times)*.95)-1]:.2f} ms')
        if selection_times:
            selection_times.sort()
            print(f'selection: median {statistics.median(selection_times):.2f} ms, '
                  f'p95 {selection_times[int(len(selection_times)*.95)-1]:.2f} ms')
        print(f'Python retained {retained-baseline} bytes, peak {peak-baseline} bytes; '
              f'canvas items {len(canvas.find_all())}; Tcl callbacks {min(command_counts)}–{max(command_counts)}')
        if errors: raise RuntimeError(f'Tk callback errors: {errors!r}')
        assert doc.to_bytes() == before, 'Project data changed during benchmark'
    finally:
        app.destroy()


if __name__ == '__main__':
    main()

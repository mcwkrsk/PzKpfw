"""Measure pure model projections, separately from platform GUI rendering."""
from statistics import median
from time import perf_counter
from is2_re.coursework import build_course_scene, create_course_project
from is2_re.decomposition_view import primitives
from is2_re.matrix_view import grouped_matrix
from is2_re.specifications import project_forms


def main():
    doc = create_course_project('Benchmark', 'Root')
    for i in range(260):
        doc.add_action(f'Action {i}', action_type='0', parent_id='1')
    for i in range(40):
        doc.add_parameter({'name': f'Parameter {i}', 'group': '1', 'number': str(i+1)})
    operations = [('Scene', lambda: build_course_scene(doc)),
                  ('Decomposition', lambda: primitives(doc)),
                  ('Matrix', lambda: grouped_matrix(doc)),
                  ('Forms', lambda: project_forms(doc))]
    snapshot = doc.to_bytes()
    print(f'{len(doc.actions)} actions; 40 parameters; median of 10 calls')
    for name, operation in operations:
        samples = []
        operation()
        for _ in range(10):
            start = perf_counter()
            operation()
            samples.append((perf_counter() - start) * 1000)
        print(f'{name:16} {median(samples):8.2f} ms')
    assert doc.to_bytes() == snapshot, 'Display code modified the project'

if __name__ == '__main__':
    main()

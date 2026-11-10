"""Reversible layout operations for focusing a diagram."""


class PackSnapshot:
    """Remember pack options and restore the original ordering exactly."""
    def __init__(self, parent):
        self.items = [(child, dict(child.pack_info())) for child in parent.pack_slaves()]

    def hide_except(self, visible):
        for child, _ in self.items:
            if child not in visible:
                child.pack_forget()

    def restore(self):
        # Remove all original children first to restore their ordering as well
        # as options such as side, padding and expansion.
        for child, _ in self.items:
            child.pack_forget()
        for child, options in self.items:
            child.pack(**options)


def restored_sash_positions(width, previous_width, previous_positions):
    """Scale the previous splitter positions and keep all three panes usable."""
    width = max(1, int(width))
    old_width = max(1, int(previous_width))
    first, second = (round(value * width / old_width) for value in previous_positions)
    if width < 300:
        return max(0, width // 4), max(1, 3 * width // 4)
    margin = min(120, width // 4)
    first = max(margin, min(first, width - 2 * margin))
    second = max(first + margin, min(second, width - margin))
    return first, second

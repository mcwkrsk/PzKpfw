"""User-facing conversions for action construction and symbol input."""
from __future__ import annotations

KIND_LABELS = {
    'Элементарное': 'elementary',
    'Последовательность': 'sequence',
    'Альтернатива': 'alternative',
    'Цикл': 'iteration',
}
KIND_NAMES = {v: k for k, v in KIND_LABELS.items()}

def encode_action_symbol(value: str) -> str | None:
    """Accept a printable character or legacy decimal UTF-16 code unit."""
    value = value.strip()
    if not value:
        return None
    if value.isdecimal():
        code = int(value)
    elif len(value) == 1:
        code = ord(value)
    else:
        raise ValueError('Укажите один символ, например z, или его числовой код 122.')
    if not 32 <= code <= 65535 or 0xD800 <= code <= 0xDFFF or not chr(code).isprintable():
        raise ValueError('Символ должен быть печатным символом в диапазоне U+0020–U+FFFF.')
    return str(code)

def display_action_symbol(value: str | None) -> str:
    if not value:
        return ''
    try:
        code = int(value)
        if 32 <= code <= 65535 and not 0xD800 <= code <= 0xDFFF and chr(code).isprintable():
            # Decimal input remains unambiguous even for a symbol that is a digit.
            return value if chr(code).isdecimal() else chr(code)
    except (ValueError, OverflowError):
        pass
    return value

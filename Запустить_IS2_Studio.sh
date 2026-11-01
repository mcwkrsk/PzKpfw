#!/usr/bin/env sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
CONT="$ROOT/continuation"
PYTHONPATH="$CONT/src${PYTHONPATH:+:$PYTHONPATH}" exec python3 -m is2_re.gui "$@"

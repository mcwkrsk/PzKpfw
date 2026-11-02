#!/usr/bin/env sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT"
python -m pytest -q
mkdir -p dist
python -m pip wheel . --no-deps --no-build-isolation --wheel-dir dist
printf '\nBuilt wheel(s):\n'
ls -1 dist/pzkpfw-*.whl

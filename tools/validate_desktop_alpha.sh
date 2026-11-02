#!/usr/bin/env sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT"
export PYTHONPATH="$ROOT/src${PYTHONPATH:+:$PYTHONPATH}"
python -m pytest -q
python tools/validate_stage2.py --out analysis/stage2_sample_roundtrip.json
python tools/validate_compatibility.py --out analysis/compatibility_0.7.9.json
mkdir -p /tmp/pzkpfw-native-checks
for source in tests/native/*.cpp; do
  name=$(basename "$source" .cpp)
  g++ -std=c++17 -Wall -Wextra -Werror -pedantic -I. -Isrc/native -Isdk \
    "$source" -o "/tmp/pzkpfw-native-checks/$name"
  "/tmp/pzkpfw-native-checks/$name"
done
if command -v xvfb-run >/dev/null 2>&1; then
  smoke_dir=$(mktemp -d)
  trap 'rm -rf "$smoke_dir"' EXIT HUP INT TERM
  cp samples/kursach_user_supplied_42_actions.is2 "$smoke_dir/smoke.is2"
  xvfb-run -a python tools/smoke_gui.py "$smoke_dir/smoke.is2"
  xvfb-run -a python tools/smoke_project_diff_gui.py
  xvfb-run -a python tools/smoke_project_merge_gui.py
else
  echo "SKIP GUI smoke: xvfb-run is unavailable (run tools/smoke_gui.py in a desktop session)"
fi

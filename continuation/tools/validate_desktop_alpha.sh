#!/usr/bin/env sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT"
export PYTHONPATH="$ROOT/src${PYTHONPATH:+:$PYTHONPATH}"
python -m pytest -q
python tools/validate_stage2.py --out analysis/stage2_sample_roundtrip.json
mkdir -p /tmp/is2-studio-native-checks
for source in tests/native/*.cpp; do
  name=$(basename "$source" .cpp)
  g++ -std=c++17 -Wall -Wextra -Werror -pedantic -I. -Isrc/native -Isdk \
    "$source" -o "/tmp/is2-studio-native-checks/$name"
  "/tmp/is2-studio-native-checks/$name"
done
if command -v xvfb-run >/dev/null 2>&1; then
  xvfb-run -a python tools/smoke_gui.py samples/kursach_user_supplied_42_actions.is2
else
  echo "SKIP GUI smoke: xvfb-run is unavailable (run tools/smoke_gui.py in a desktop session)"
fi

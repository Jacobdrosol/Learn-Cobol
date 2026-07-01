#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 1 ]; then
  printf 'Usage: scripts/run-program.sh path/to/program.cbl [args...]\n' >&2
  exit 2
fi

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$1"
shift
NAME="$(basename "$SRC" .cbl)"
OUT="$ROOT_DIR/build/$NAME"

mkdir -p "$ROOT_DIR/build"
"$ROOT_DIR/scripts/cobc-local" -x -free -Wall "$ROOT_DIR/$SRC" -o "$OUT"
"$OUT" "$@"

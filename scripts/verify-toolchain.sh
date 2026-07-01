#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

cat > "$TMP_DIR/smoke.cbl" <<'COBOL'
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SMOKE.
       PROCEDURE DIVISION.
           DISPLAY "COBOL TOOLCHAIN OK".
           GOBACK.
COBOL

"$ROOT_DIR/scripts/cobc-local" -x -free "$TMP_DIR/smoke.cbl" -o "$TMP_DIR/smoke"
"$TMP_DIR/smoke"

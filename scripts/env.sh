#!/usr/bin/env bash
# Source this file from the repository root or any subdirectory:
#   source scripts/env.sh

if [ -n "${BASH_VERSION:-}" ]; then
  SCRIPT_PATH="${BASH_SOURCE[0]}"
elif [ -n "${ZSH_VERSION:-}" ]; then
  SCRIPT_PATH="${(%):-%x}"
else
  SCRIPT_PATH="$0"
fi

ROOT_DIR="$(cd "$(dirname "$SCRIPT_PATH")/.." && pwd)"
LOCAL_TOOLCHAIN="$ROOT_DIR/tools/gnucobol"

if [ -x "$LOCAL_TOOLCHAIN/usr/bin/cobc" ]; then
  export PATH="$LOCAL_TOOLCHAIN/usr/bin:$PATH"
  export LD_LIBRARY_PATH="$LOCAL_TOOLCHAIN/usr/lib/x86_64-linux-gnu${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
  export COB_CONFIG_DIR="$LOCAL_TOOLCHAIN/etc/gnucobol"
  export COB_COPY_DIR="$LOCAL_TOOLCHAIN/usr/share/gnucobol/copy"
fi

export LEARN_COBOL_ROOT="$ROOT_DIR"
export LEARN_COBOL_COBC="$ROOT_DIR/scripts/cobc-local"
export COBOL_PRACTICE_ROOT="$LEARN_COBOL_ROOT"
export COBOL_PRACTICE_COBC="$LEARN_COBOL_COBC"

printf 'Learn-Cobol environment ready at %s\n' "$ROOT_DIR"
if command -v cobc >/dev/null 2>&1; then
  cobc -V | sed -n '1p'
else
  printf 'No cobc found. Run scripts/bootstrap-gnucobol.sh while online, or install GnuCOBOL.\n'
fi

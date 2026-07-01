#!/usr/bin/env bash
# Source this file from the repository root or any subdirectory:
#   source scripts/env.sh

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LOCAL_TOOLCHAIN="$ROOT_DIR/tools/gnucobol"

if [ -x "$LOCAL_TOOLCHAIN/usr/bin/cobc" ]; then
  export PATH="$LOCAL_TOOLCHAIN/usr/bin:$PATH"
  export LD_LIBRARY_PATH="$LOCAL_TOOLCHAIN/usr/lib/x86_64-linux-gnu${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
  export COB_CONFIG_DIR="$LOCAL_TOOLCHAIN/etc/gnucobol"
  export COB_COPY_DIR="$LOCAL_TOOLCHAIN/usr/share/gnucobol/copy"
fi

export COBOL_PRACTICE_ROOT="$ROOT_DIR"
export COBOL_PRACTICE_COBC="$ROOT_DIR/scripts/cobc-local"

printf 'Learn-Cobol environment ready at %s\n' "$ROOT_DIR"
if command -v cobc >/dev/null 2>&1; then
  cobc -V | sed -n '1p'
else
  printf 'No cobc found. Run scripts/bootstrap-gnucobol.sh while online, or install GnuCOBOL.\n'
fi

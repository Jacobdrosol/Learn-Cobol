#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PKG_DIR="$ROOT_DIR/tools/packages"
TOOL_DIR="$ROOT_DIR/tools/gnucobol"

mkdir -p "$PKG_DIR" "$TOOL_DIR"

if ! command -v apt-get >/dev/null 2>&1 || ! command -v dpkg-deb >/dev/null 2>&1; then
  cat >&2 <<'EOF'
This bootstrap script is for Debian/Ubuntu systems with apt-get and dpkg-deb.
Install GnuCOBOL manually on this platform, or use a Debian/Ubuntu machine to
prepare the offline toolchain.
EOF
  exit 1
fi

(
  cd "$PKG_DIR"
  apt-get download gnucobol4 libcob5-dev libcob5t64 libgmp-dev
)

rm -rf "$TOOL_DIR"
mkdir -p "$TOOL_DIR"
for deb in "$PKG_DIR"/*.deb; do
  dpkg-deb -x "$deb" "$TOOL_DIR"
done

"$ROOT_DIR/scripts/verify-toolchain.sh"

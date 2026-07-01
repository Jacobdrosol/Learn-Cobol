#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT_DIR="$ROOT_DIR/offline-vendor/ibm-pdfs"
mkdir -p "$OUT_DIR"

download() {
  local url="$1"
  local file="$2"
  if [ -s "$OUT_DIR/$file" ]; then
    printf 'exists: %s\n' "$file"
    return
  fi
  printf 'download: %s\n' "$file"
  curl -L --fail --retry 3 --output "$OUT_DIR/$file" "$url"
}

download "https://www.ibm.com/docs/en/SS6SG3_6.5/download/cobolv6r5_en.zip" "enterprise-cobol-6.5-english-pdfs.zip"
download "https://www.ibm.com/docs/SSLTBW_3.2.0/pdf/ieab500_v3r2.pdf" "zos-3.2-mvs-jcl-users-guide.pdf"
download "https://www.ibm.com/docs/en/SSEPEK_12.0.0/pdf/db2z_12_apsgbook.pdf" "db2-12-for-zos-application-programming-sql-guide.pdf"
download "https://www.ibm.com/docs/SSEPH2_15.3.0/pdf/IMS_15.3_Application_Programming.pdf" "ims-15.3-application-programming.pdf"

cat > "$OUT_DIR/README.txt" <<'EOF'
These files were downloaded for personal offline reference.

They are intentionally ignored by Git and should not be committed to a public
repository without reviewing IBM's terms and copyright notices.

Primary source pages:
- https://www.ibm.com/support/pages/enterprise-cobol-zos-documentation-library
- https://www.ibm.com/docs/en/zos/3.2.0
- https://www.ibm.com/docs/en/db2-for-zos/12.0.0
- https://www.ibm.com/docs/en/ims/15.3.0
EOF

printf 'offline docs saved under %s\n' "$OUT_DIR"

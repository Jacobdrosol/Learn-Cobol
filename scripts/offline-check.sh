#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

printf 'Checking COBOL toolchain...\n'
scripts/verify-toolchain.sh >/dev/null

printf 'Running COBOL test suite...\n'
make test

printf 'Building Learn-Cobol site...\n'
npm run build

printf 'Checking offline reference material...\n'
test -d third_party/open-mainframe-cobol-course
test -s offline-vendor/ibm-pdfs/enterprise-cobol-6.5-english-pdfs.zip
test -s offline-vendor/ibm-pdfs/zos-3.2-mvs-jcl-users-guide.pdf
test -s offline-vendor/ibm-pdfs/db2-12-for-zos-application-programming-sql-guide.pdf
test -s offline-vendor/ibm-pdfs/ims-15.3-application-programming.pdf

printf 'Offline readiness check passed.\n'

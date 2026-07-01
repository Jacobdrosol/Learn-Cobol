#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ACTUAL_DIR="$ROOT_DIR/build/test-output"
mkdir -p "$ACTUAL_DIR"

run_and_diff() {
  local name="$1"
  local command="$2"
  local expected="$3"
  local actual="$ACTUAL_DIR/$name.out"

  (cd "$ROOT_DIR" && eval "$command") > "$actual"
  diff -u "$expected" "$actual"
  printf 'ok: %s\n' "$name"
}

run_and_diff hello "./build/hello" "$ROOT_DIR/exercises/01-hello/expected.out"
run_and_diff invoice "./build/invoice" "$ROOT_DIR/exercises/02-arithmetic/expected.out"
run_and_diff grades "./build/grade-report" "$ROOT_DIR/exercises/03-branching/expected.out"
run_and_diff tables "./build/table-search" "$ROOT_DIR/exercises/04-tables/expected.out"
run_and_diff files "./build/customer-report" "$ROOT_DIR/exercises/05-files/expected.out"
run_and_diff tax "./build/tax-demo" "$ROOT_DIR/exercises/06-subprograms/expected.out"
run_and_diff sort "./build/sort-transactions" "$ROOT_DIR/exercises/07-sorting/expected.out"
run_and_diff payroll "./build/payroll-report" "$ROOT_DIR/projects/batch-payroll/expected/payroll-report.out"
run_and_diff ledger "./build/bank-ledger" "$ROOT_DIR/projects/bank-ledger/expected/bank-ledger.out"
run_and_diff capstone "./build/capstone-ledger" "$ROOT_DIR/projects/capstone-core-banking/expected/capstone-ledger.out"

printf 'all tests passed\n'

SHELL := /usr/bin/env bash
COBC := ./scripts/cobc-local
BUILD := build

.PHONY: help verify build test clean hello invoice grades tables files tax sort payroll ledger capstone

help:
	@printf '%s\n' \
		'Targets:' \
		'  make verify    Check local toolchain and compile a smoke test' \
		'  make build     Compile all exercises and projects' \
		'  make test      Compile and run golden-output tests' \
		'  make clean     Remove build output' \
		'  make hello     Run the first COBOL program' \
		'  make payroll   Run the batch payroll portfolio project' \
		'  make ledger    Run the bank ledger portfolio project' \
		'' \
		'Start with: source scripts/env.sh && make test'

verify:
	@./scripts/verify-toolchain.sh

build: $(BUILD)/hello $(BUILD)/invoice $(BUILD)/grade-report $(BUILD)/table-search $(BUILD)/customer-report $(BUILD)/tax-demo $(BUILD)/sort-transactions $(BUILD)/payroll-report $(BUILD)/bank-ledger $(BUILD)/capstone-ledger

$(BUILD)/.dir:
	@mkdir -p $(BUILD)
	@touch $(BUILD)/.dir

$(BUILD)/hello: exercises/01-hello/hello.cbl | $(BUILD)/.dir
	$(COBC) -x -free -Wall $< -o $@

$(BUILD)/invoice: exercises/02-arithmetic/invoice.cbl | $(BUILD)/.dir
	$(COBC) -x -free -Wall $< -o $@

$(BUILD)/grade-report: exercises/03-branching/grade-report.cbl | $(BUILD)/.dir
	$(COBC) -x -free -Wall $< -o $@

$(BUILD)/table-search: exercises/04-tables/table-search.cbl | $(BUILD)/.dir
	$(COBC) -x -free -Wall $< -o $@

$(BUILD)/customer-report: exercises/05-files/customer-report.cbl | $(BUILD)/.dir
	$(COBC) -x -free -Wall $< -o $@

$(BUILD)/tax-demo: exercises/06-subprograms/main.cbl exercises/06-subprograms/taxcalc.cbl | $(BUILD)/.dir
	$(COBC) -x -free -Wall $^ -o $@

$(BUILD)/sort-transactions: exercises/07-sorting/sort-transactions.cbl | $(BUILD)/.dir
	$(COBC) -x -free -Wall $< -o $@

$(BUILD)/payroll-report: projects/batch-payroll/src/payroll-report.cbl | $(BUILD)/.dir
	$(COBC) -x -free -Wall $< -o $@

$(BUILD)/bank-ledger: projects/bank-ledger/src/bank-ledger.cbl | $(BUILD)/.dir
	$(COBC) -x -free -Wall $< -o $@

$(BUILD)/capstone-ledger: projects/capstone-core-banking/src/capstone-ledger.cbl | $(BUILD)/.dir
	$(COBC) -x -free -Wall -I copybooks $< -o $@

test: build
	@./tests/run-all.sh

hello: $(BUILD)/hello
	@$(BUILD)/hello

invoice: $(BUILD)/invoice
	@$(BUILD)/invoice

grades: $(BUILD)/grade-report
	@$(BUILD)/grade-report

tables: $(BUILD)/table-search
	@$(BUILD)/table-search

files: $(BUILD)/customer-report
	@$(BUILD)/customer-report

tax: $(BUILD)/tax-demo
	@$(BUILD)/tax-demo

sort: $(BUILD)/sort-transactions
	@$(BUILD)/sort-transactions

payroll: $(BUILD)/payroll-report
	@$(BUILD)/payroll-report

ledger: $(BUILD)/bank-ledger
	@$(BUILD)/bank-ledger

capstone: $(BUILD)/capstone-ledger
	@$(BUILD)/capstone-ledger

clean:
	@rm -rf $(BUILD)

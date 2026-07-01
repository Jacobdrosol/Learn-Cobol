# 30-Day COBOL and Mainframe Course

This is an aggressive full-time plan. Each day assumes several focused blocks:
read, code, test, write notes, and improve the portfolio. If you only have a few
hours, split each day into two or three calendar days.

Every day:

- run `make test` before starting
- read the assigned docs
- write or modify COBOL
- commit small working changes
- keep a learning log in `notes/` if you want daily proof of progress

## Week 1: Programming and COBOL Basics

Day 1: Setup and first program

- Read `docs/00-start-here.md`.
- Run `source scripts/env.sh` and `make test`.
- Complete `exercises/01-hello`.
- Write a short note explaining `IDENTIFICATION DIVISION` and `PROCEDURE DIVISION`.

Day 2: Programming fundamentals

- Read `docs/01-programming-primer.md`.
- Modify `exercises/02-arithmetic/invoice.cbl`.
- Add discount logic and update the expected output.
- Run `make test`.

Day 3: COBOL structure

- Read `docs/02-cobol-fundamentals.md`.
- Rewrite the hello program using your own paragraph names.
- Study `PIC 9`, `PIC X`, `V`, `VALUE`, `MOVE`, `ADD`, `SUBTRACT`, `MULTIPLY`,
  `DIVIDE`, and `COMPUTE`.

Day 4: Branching and validation

- Complete `exercises/03-branching`.
- Add letter grades with `EVALUATE`.
- Add one invalid input row and handle it explicitly.

Day 5: Tables

- Complete `exercises/04-tables`.
- Add a total balance.
- Add a "not found" lookup and prove both paths work.

Day 6: File processing

- Read `docs/03-data-files-testing.md`.
- Complete `exercises/05-files`.
- Add one summary by threshold, such as balances over 100000.

Day 7: Review and refactor

- Reread your modified programs.
- Rename unclear fields.
- Remove dead code.
- Make sure `make test` passes.
- Read the Open Mainframe Course #1 README under `third_party/`.

## Week 2: Batch, Subprograms, and Mainframe Shape

Day 8: Subprograms

- Complete `exercises/06-subprograms`.
- Add another subprogram for discount or fee calculation.
- Explain `WORKING-STORAGE`, `LINKAGE SECTION`, and `USING`.

Day 9: Sorting and control totals

- Complete `exercises/07-sorting`.
- Add a transaction total before and after sorting.
- Read `jcl/sort-report.jcl`.

Day 10: Batch project pass 1

- Run `make payroll`.
- Read `projects/batch-payroll/README.md`.
- Add an output total by department.

Day 11: Batch project pass 2

- Add malformed-record handling to the payroll project.
- Add an exception count.
- Keep tests passing.

Day 12: z/OS batch concepts

- Read `docs/04-jcl-and-batch.md`.
- Read `jcl/compile-and-run-cobol.jcl`.
- Write a plain-English explanation of JOB, EXEC, DD, SYSIN, SYSOUT, and return codes.

Day 13: Mainframe operating environment

- Read `docs/05-zos-ecosystem.md`.
- Make flashcards from `docs/glossary.md`.
- Explain the difference between MVS/z/OS, USS, TSO/ISPF, JES2, and SDSF.

Day 14: Weekly portfolio checkpoint

- Polish `projects/batch-payroll`.
- Add a `design.md` under that project.
- Include input layout, output layout, return code policy, and test cases.

## Week 3: Data Stores, Transactions, and Modern Mainframe

Day 15: Banking ledger pass 1

- Run `make ledger`.
- Read `projects/bank-ledger/README.md`.
- Add opening and ending control totals.

Day 16: Banking ledger pass 2

- Add debit and credit counts.
- Add reject totals.
- Add tests for an unknown account.

Day 17: Db2, VSAM, CICS, IMS

- Read `docs/06-db2-cics-ims-vsam.md`.
- Write a comparison table: VSAM vs Db2 vs IMS vs flat files.
- Add a fake embedded SQL example in comments or docs, but keep local code runnable.

Day 18: Copybooks and record layout discipline

- Study `copybooks/ACCOUNT-RECORD.cpy` and `copybooks/TRANSACTION-RECORD.cpy`.
- Add a copybook to one exercise or project.
- Explain why copybooks are a contract, not just a convenience.

Day 19: Capstone pass 1

- Run `make capstone`.
- Read `projects/capstone-core-banking/README.md`.
- Add output files for report and rejects if you are ready; otherwise document the design.

Day 20: Capstone pass 2

- Add control totals to capstone.
- Add return-code policy in the README.
- Keep `make test` green.

Day 21: Official course substitution day

- Read `docs/offline-resources.md`.
- Work through the vendored Open Mainframe Course #2 material.
- When online later, register for IBM Z Xplore and IBM Z Mainframe Skills Depot.

## Week 4: Quality, Operations, and Job Readiness

Day 22: Testing discipline

- Read `docs/03-data-files-testing.md` again.
- Add a new test to `tests/run-all.sh`.
- Add an expected output fixture.

Day 23: Debugging and abends

- Learn how file status, return codes, and abnormal ends fit together.
- Add file status checks to any program missing them.
- Add a bad input case and make the error message useful.

Day 24: Operations thinking

- Read `docs/04-jcl-and-batch.md` again.
- Add restart notes to a project README.
- Explain what can be rerun safely and what cannot.

Day 25: Modern tooling

- Read the Zowe section in `docs/05-zos-ecosystem.md`.
- Write a short plan for using VS Code, Zowe Explorer, Git, and CI with a real z/OS account.

Day 26: Resume project polish

- Read `docs/07-career-portfolio.md`.
- Improve project READMEs.
- Add screenshots or terminal transcripts later if desired, but keep the repo text-first.

Day 27: Interview drills

- Answer every question in `docs/07-career-portfolio.md`.
- Practice explaining one COBOL program from input to output.
- Practice explaining one JCL member step by step.

Day 28: Capstone hardening

- Add one new business rule.
- Add tests.
- Update design notes.

Day 29: Public repo cleanup

- Run `git status`.
- Confirm ignored toolchain and IBM PDFs are not staged.
- Check `NOTICE.md`.
- Run `make clean && make test`.

Day 30: Final review

- Read every top-level README.
- Create a portfolio summary in your own words.
- Make one clean commit.
- List what you will complete in months two and three.

## Completion Standard

You are done with month one when you can:

- write small COBOL programs without copying examples
- read a file, validate records, calculate totals, and print a report
- explain how COBOL is compiled and run in local GnuCOBOL vs z/OS
- explain JCL at a beginner level
- explain where Db2, CICS, IMS, VSAM, RACF, JES2, SDSF, USS, and Zowe fit
- show at least two tested portfolio projects
- talk honestly about what you have not done yet on a real mainframe

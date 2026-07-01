# Start Here

This repository is designed for a beginner who wants to learn by building. You
do not need to understand all mainframe vocabulary before writing COBOL. Start
with local programs, then connect each concept to how z/OS shops run work.

## First Session

Run:

```bash
source scripts/env.sh
make test
```

Expected result: every test prints `ok` and the final line says all tests
passed.

If that works, run:

```bash
make hello
make payroll
make ledger
```

Read the matching source files after each command. Do not skim the output. Tie
each line of output back to a COBOL statement.

## Mental Model

COBOL is usually used for business records:

- accounts
- policies
- claims
- invoices
- payroll
- inventory
- payments
- tax records

Mainframe development is usually about reliable processing:

- read a lot of records
- validate them
- apply business rules
- update durable stores
- produce reports or downstream files
- prove totals balance
- recover cleanly when something fails

The local exercises simulate that style with small files and tests.

## Local vs Real Mainframe

Local GnuCOBOL:

- compiles COBOL to C and then to a local executable
- is excellent for learning syntax and program structure
- does not provide real z/OS services, JES2, RACF, CICS, IMS, Db2 for z/OS, or VSAM behavior

Real z/OS:

- uses site compiler procedures, load libraries, data sets, JCL, JES2/JES3, SDSF, security, schedulers, and operations standards
- often runs Enterprise COBOL, Db2, CICS, IMS, VSAM, and Language Environment
- has strict naming, permissions, audit, and change-control rules

The goal is to build transferable COBOL thinking locally, then validate it on
IBM Z Xplore or another mainframe training environment when online.

## Study Rule

For every program, answer:

- What is the input?
- What is the output?
- What business rule is applied?
- What happens if input is missing or malformed?
- What totals prove the run was complete?
- What return code should operations see?
- Could the job be rerun safely?

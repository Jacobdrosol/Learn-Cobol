# COBOL Practice and Mainframe Mastery Track

This repository is an offline-first learning workspace for COBOL, z/OS-style
batch development, and the mainframe application ecosystem. It includes:

- a repo-local GnuCOBOL setup on this machine
- runnable COBOL exercises with golden-output tests
- portfolio projects that model batch payroll and banking ledger jobs
- JCL examples, copybooks, test fixtures, and a capstone project
- an original 30-day course plan and a 90-day job-readiness roadmap
- a vendored copy of the CC BY 4.0 Open Mainframe Project COBOL Programming
  Course for supplemental offline reading

Start here:

```bash
source scripts/env.sh
make test
```

If the tests pass, the repo is ready for offline work.

## How To Use This Repo

1. Read `COURSE.md`.
2. Work day by day through `docs/` and the matching `exercises/`.
3. Run `make test` after every change.
4. Extend the projects under `projects/`.
5. Use `ROADMAP.md` after the first month to turn the work into a stronger
   junior-mainframe portfolio.

The most useful commands are:

```bash
make help
make verify
make build
make test
make hello
make payroll
make ledger
make capstone
```

## Offline Tooling

This workstation has a local GnuCOBOL toolchain extracted under
`tools/gnucobol/`. That directory is intentionally ignored by Git so a future
public repository does not redistribute binaries by accident.

If this repo is cloned elsewhere while online on Ubuntu, recreate the toolchain:

```bash
scripts/bootstrap-gnucobol.sh
```

If you already have GnuCOBOL installed globally, the scripts will use it.

## What This Teaches

COBOL skills:

- divisions, sections, paragraphs, and statements
- `PIC` clauses and edited numeric output
- arithmetic, branching, loops, tables, and subprograms
- line sequential file processing
- copybooks and record layouts
- testable batch program structure

Mainframe skills:

- what z/OS, JES2, JCL, TSO/ISPF, USS, RACF, SDSF, Db2, CICS, IMS, VSAM, LE,
  and Zowe are for
- how batch jobs are compiled, linked, executed, tested, and diagnosed
- how COBOL programs fit into transaction, database, and modernization work
- how to talk about mainframe work in job interviews

## Reality Check

One month of full-time work can build serious foundation and a useful portfolio,
but "mastery" in mainframes normally means years of exposure to production
systems, job scheduling, operations, abnormal ends, data controls, security,
performance, and site standards. Treat month one as a hard launch. Treat months
two and three as the period where you make the projects credible enough for
junior roles.

## Current External Learning Map

Checked on 2026-07-01:

- IBM Z Xplore: free, challenge-based IBM Z learning with badges.
  https://www.ibm.com/products/z/resources/zxplore
- IBM Z Mainframe Skills Depot: IBM learning paths by job role, including
  application developer and hands-on labs.
  https://www.ibm.com/products/z/resources/mainframe-skills
- Open Mainframe Project COBOL Programming Course: open-source COBOL course
  materials and labs.
  https://openmainframeproject.org/projects/cobol-programming-course/
- Cognitive Class "Learning COBOL Programming with VSCode": introductory COBOL
  course and badge.
  https://cognitiveclass.ai/courses/learning-cobol-programming-with-vscode
- IBM Enterprise COBOL for z/OS documentation library:
  https://www.ibm.com/support/pages/enterprise-cobol-zos-documentation-library
- IBM z/OS product and learning resources:
  https://www.ibm.com/products/zos
- Zowe: open-source framework and tooling for z/OS.
  https://www.zowe.org/

Coursera is deliberately not used in this path.

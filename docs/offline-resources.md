# Offline Resources and Course Substitutes

This file tells you what is available offline now and what to complete later
when internet access returns.

## Offline In This Repository

Original course path:

- `COURSE.md`
- `ROADMAP.md`
- `docs/`
- `exercises/`
- `projects/`
- `jcl/`
- `copybooks/`

Supplemental vendored course:

- `third_party/open-mainframe-cobol-course/`

That Open Mainframe course is licensed CC BY 4.0. Start with its top-level
README, then work through course 1, 2, 3, and 4.

Local tools:

- `tools/gnucobol/` exists on this machine for offline compiling
- `tools/packages/` has the downloaded package backups on this machine
- both are ignored for future public GitHub publishing

Optional downloaded IBM PDFs:

- `offline-vendor/ibm-pdfs/` may exist locally after running
  `scripts/download-official-docs.sh`
- this directory is ignored by Git
- do not commit proprietary IBM PDFs to a public repository without reviewing terms

## Online Courses To Complete Later

Preferred path:

1. IBM Z Xplore
   - free challenge-based IBM Z learning
   - badges can help with entry-level signaling
   - https://www.ibm.com/products/z/resources/zxplore

2. IBM Z Mainframe Skills Depot
   - IBM learning paths by job role
   - application developer path includes COBOL, Java, Python, CICS, IMS, GitHub,
     and related topics according to IBM's page
   - https://www.ibm.com/products/z/resources/mainframe-skills

3. Open Mainframe Project COBOL Programming Course
   - already vendored here for offline reading
   - online project page: https://openmainframeproject.org/projects/cobol-programming-course/

4. Cognitive Class "Learning COBOL Programming with VSCode"
   - introductory COBOL course and badge
   - https://cognitiveclass.ai/courses/learning-cobol-programming-with-vscode

5. Paid or employer-sponsored substitutes
   - IBM-authorized LearnQuest mainframe bootcamps
   - Interskill Enterprise COBOL / mainframe application programmer courses
   - Pluralsight path if you already have access

## Official Documentation To Keep Handy

Use IBM docs as references, not as a beginner course:

- Enterprise COBOL for z/OS documentation library:
  https://www.ibm.com/support/pages/enterprise-cobol-zos-documentation-library
- z/OS product and resources:
  https://www.ibm.com/products/zos
- Db2 for z/OS programming:
  https://www.ibm.com/docs/en/db2-for-zos/12.0.0?topic=zos-programming-db2
- z/OS Connect overview:
  https://www.ibm.com/docs/en/zos-connect/3.0.0?topic=overview-what-is-zos-connect
- Zowe:
  https://www.zowe.org/

## How To Study Offline On The Plane

1. Run `make test` before leaving.
2. Open `COURSE.md`.
3. Complete day 1 and day 2.
4. Modify a program.
5. Run the matching `make` target.
6. Run `make test`.
7. Write notes in plain text.

If you get stuck, inspect a working exercise and make the smallest change that
you understand.

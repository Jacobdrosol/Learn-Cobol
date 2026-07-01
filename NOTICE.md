# Notices and Third-Party Material

This repository contains original learning material, exercises, scripts, and
sample COBOL programs under the MIT License unless a file or directory states
otherwise.

## Vendored Open Mainframe Project course

`third_party/open-mainframe-cobol-course/` is a snapshot of the Open Mainframe
Project COBOL Programming Course:

- Source: https://github.com/openmainframeproject/cobol-programming-course
- Project page: https://openmainframeproject.org/projects/cobol-programming-course/
- License: Creative Commons Attribution 4.0 International
- Attribution: course materials made available through a collaboration between
  IBM, its clients, and American River College, contributed to the Open
  Mainframe Project.

The vendored copy is included as supplemental offline reading. The opinionated
day-by-day path in this repository is original and does not modify the vendored
course.

## Local GnuCOBOL toolchain

The local toolchain under `tools/gnucobol/` and package backups under
`tools/packages/` are intentionally ignored by Git. They were extracted from
Ubuntu packages for offline use on this workstation:

- `gnucobol4`
- `libcob5-dev`
- `libcob5t64`

Use `scripts/bootstrap-gnucobol.sh` to recreate them on an Ubuntu system with
internet access. Review the package copyright files and GPL terms before
redistributing compiled binaries.

## IBM documentation and course links

IBM documentation, IBM Z Xplore, IBM Z Mainframe Skills Depot, z/OS, Db2,
CICS, IMS, and z/OS Connect links are referenced as external learning sources.
This repository summarizes concepts in original words and does not republish
IBM proprietary course content.

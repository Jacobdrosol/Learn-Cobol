# Flight Checklist

Run this before leaving:

```bash
scripts/offline-check.sh
```

Expected result:

- the local GnuCOBOL compiler works
- every COBOL exercise and project test passes
- the Learn-Cobol site builds
- offline IBM reference files are present locally
- the vendored Open Mainframe Project course is present

On the plane:

```bash
source scripts/env.sh
make test
less COURSE.md
```

Then follow Day 1 in `COURSE.md`.

Useful offline commands:

```bash
make hello
make invoice
make grades
make files
make payroll
make ledger
make capstone
npm run build
```

The local compiler and reference PDFs are intentionally ignored by Git, but they
are present on this PC.

# Portfolio Project: Batch Payroll

This is a small mainframe-style batch program:

- input file: `projects/batch-payroll/data/employees.csv`
- COBOL source: `projects/batch-payroll/src/payroll-report.cbl`
- output: payroll summary to standard output
- test fixture: `projects/batch-payroll/expected/payroll-report.out`

Run:

```bash
make payroll
make test
```

Portfolio extension ideas:

- Write an output file instead of only displaying.
- Add a control report by department.
- Add file status handling for malformed records.
- Add a JCL member that documents compile, link, and run steps.
- Add a `docs/design.md` explaining record layouts and abend strategy.

# Exercise 07: Sorting

Goal: sort transaction-like records by account and amount using a table. Real
mainframe shops often use DFSORT/SYNCSORT in JCL; this local exercise keeps
the logic visible in COBOL.

Run:

```bash
make sort
```

Practice changes:

- Reverse the sort order.
- Add a date field.
- Replace the in-memory sort with a COBOL `SORT` statement.

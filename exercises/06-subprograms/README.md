# Exercise 06: Subprograms

Goal: split a calculation into a callable COBOL subprogram.

Run:

```bash
make tax
```

Study:

- `CALL "TAXCALC" USING ...` passes fields by reference.
- The subprogram receives parameters in the `LINKAGE SECTION`.
- `EXIT PROGRAM` returns control to the caller.

Practice changes:

- Add a second call with a different amount.
- Add a shipping amount parameter.
- Change `TAXCALC` to return a total as well as tax.

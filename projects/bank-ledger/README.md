# Portfolio Project: Bank Ledger

This project simulates a batch posting job:

- read starting balances
- read transaction records
- update account balances in a COBOL table
- report final balances
- flag unknown accounts

Run:

```bash
make ledger
```

Portfolio extension ideas:

- Add an exception output file.
- Add an audit trailer that counts debits, credits, rejects, and total amount.
- Add balancing controls: opening total + transaction total = ending total.
- Add an indexed-file version once you have a real z/OS or GnuCOBOL indexed-file setup.

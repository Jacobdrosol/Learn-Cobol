# Capstone Project: Core Banking Batch Posting

This capstone is the repository's "show mastery" project. The included version
is deliberately small enough to read, run, and test offline. Your job over the
course is to grow it into a polished public portfolio repository.

Current capabilities:

- reads account master records
- reads debit and credit transaction records
- uses copybooks for account and transaction layouts
- produces final balances
- rejects unknown accounts
- is covered by `make test`

Run:

```bash
make capstone
make test
```

Milestones to add:

- output files for reports and rejects
- control totals and return-code policy
- JCL compile/run members
- a design document with record layouts
- before/after modernization notes
- a small API wrapper in another language that calls the batch program

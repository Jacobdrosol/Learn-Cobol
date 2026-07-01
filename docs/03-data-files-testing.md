# Data, Files, and Testing

Mainframe application work is often file and record work. Even when Db2, IMS,
or CICS is involved, developers still spend a lot of time reasoning about
record layouts and controls.

## Record Layouts

A record layout says what every byte means. Example:

```text
columns 1-6    account id
columns 7-30   account name
columns 31-41  signed balance with 2 decimal places
```

COBOL expresses this with levels:

```cobol
01  ACCOUNT-RECORD.
    05 ACCT-ID        PIC X(06).
    05 ACCT-NAME      PIC X(24).
    05 ACCT-BALANCE   PIC S9(09)V99.
```

Level numbers describe hierarchy. `01` is the group. `05` fields are inside the
group.

## File Status

Always check file status. Common examples:

- `00`: success
- `10`: end of file for sequential reads
- `35`: file not found, depending on compiler/runtime and file organization

In this repo, programs use `FILE STATUS IS WS-FILE-STATUS` and check after
`OPEN`.

## Control Totals

Control totals prove processing:

- input record count
- output record count
- reject count
- total debit amount
- total credit amount
- opening balance total
- ending balance total

For a ledger:

```text
opening total + credits - debits = ending total
```

If this does not balance, the job should not be trusted.

## Testing Pattern

The repo uses golden-output tests:

1. compile the program
2. run it with fixed input data
3. capture output
4. compare output with an expected file

This is simple but valuable. It catches accidental formatting changes,
calculation mistakes, and broken file paths.

To add a test:

1. Add or modify a program.
2. Compile it in `Makefile`.
3. Add an expected output file.
4. Add a `run_and_diff` line in `tests/run-all.sh`.
5. Run `make test`.

## Production Thinking

Before changing a batch program, ask:

- What upstream job creates the input?
- What downstream job consumes the output?
- Is the file fixed, variable, VSAM, Db2 unload, or report format?
- Are there trailer records?
- What are the restart rules?
- What return codes does the scheduler expect?
- What happens to partial output on failure?

This mindset matters as much as syntax for junior mainframe work.

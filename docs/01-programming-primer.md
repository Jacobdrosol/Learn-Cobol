# Programming Primer

If you are new to programming, focus on the ideas below before worrying about
mainframe vocabulary.

## Data

A program stores values in named fields. In COBOL, most fields are declared in
the `DATA DIVISION`.

Examples:

```cobol
01  WS-NAME        PIC X(20).
01  WS-COUNT       PIC 9(03) VALUE ZERO.
01  WS-AMOUNT      PIC 9(07)V99 VALUE ZERO.
```

Meaning:

- `PIC X(20)` stores up to 20 characters.
- `PIC 9(03)` stores three decimal digits.
- `PIC 9(07)V99` stores seven digits before an implied decimal and two after it.
- `VALUE` gives an initial value.

COBOL's `V` is an implied decimal point. It is not stored as a character.

## Control Flow

Programs run statements in order unless you tell them to branch or loop.

Branch:

```cobol
IF WS-SCORE >= 70
    DISPLAY "PASS"
ELSE
    DISPLAY "REVIEW"
END-IF
```

Loop:

```cobol
PERFORM UNTIL WS-EOF = "Y"
    READ INPUT-FILE
        AT END MOVE "Y" TO WS-EOF
        NOT AT END PERFORM PROCESS-RECORD
    END-READ
END-PERFORM
```

## Functions and Subprograms

A subprogram is reusable logic. COBOL calls another program with `CALL`.

```cobol
CALL "TAXCALC" USING WS-AMOUNT WS-RATE WS-TAX.
```

The called program defines those parameters in its `LINKAGE SECTION`.

## Testing

A test proves behavior. In this repo, tests:

- compile all programs
- run each program
- compare actual output to expected output

When you change behavior, update the expected output only after you verify the
new output is correct.

Run:

```bash
make test
```

## Debugging

Debugging is not guessing. Use a loop:

1. State what you expected.
2. State what happened.
3. Find the smallest input that reproduces it.
4. Add `DISPLAY` statements or inspect data.
5. Fix one thing.
6. Rerun tests.

In production mainframe work, debugging often starts from job output, return
codes, abend codes, dump output, file status codes, and scheduler history.

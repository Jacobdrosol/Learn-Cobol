# COBOL Fundamentals

COBOL stands for Common Business-Oriented Language. Its syntax is verbose
because it was designed to make business logic readable and stable.

## Program Structure

Common divisions:

- `IDENTIFICATION DIVISION`: program name and metadata.
- `ENVIRONMENT DIVISION`: files and external environment.
- `DATA DIVISION`: records, working fields, constants, linkage fields.
- `PROCEDURE DIVISION`: executable logic.

Common sections:

- `FILE SECTION`: layouts for files.
- `WORKING-STORAGE SECTION`: fields that exist for the life of the program.
- `LOCAL-STORAGE SECTION`: fresh storage for each invocation.
- `LINKAGE SECTION`: parameters passed by a caller.

## Naming

COBOL names are often descriptive:

```cobol
WS-TOTAL-BALANCE
CUSTOMER-RECORD
PROCESS-CUSTOMER
```

Common prefixes:

- `WS-`: working storage
- `LK-`: linkage
- `FD` or file-specific names: file records
- `TB-`: table fields

Use names that describe business meaning, not implementation guesses.

## Picture Clauses

`PIC` defines storage shape.

- `X`: alphanumeric character
- `9`: numeric digit
- `S`: signed numeric
- `V`: implied decimal
- `Z`, `$`, comma, period: edited display output

Examples:

```cobol
01  WS-ID        PIC X(06).
01  WS-QTY       PIC 9(03).
01  WS-AMOUNT    PIC S9(07)V99.
01  WS-MONEY     PIC $$$,$$9.99.
```

Be careful with field sizes. If a field is too small, values can truncate or
display incorrectly. This is why record layouts matter.

## Core Statements

Move:

```cobol
MOVE WS-SOURCE TO WS-TARGET.
```

Arithmetic:

```cobol
ADD WS-AMOUNT TO WS-TOTAL.
SUBTRACT WS-TAX FROM WS-GROSS GIVING WS-NET.
MULTIPLY WS-RATE BY WS-HOURS GIVING WS-GROSS ROUNDED.
COMPUTE WS-BALANCE = WS-OPENING + WS-CREDITS - WS-DEBITS.
```

Branch:

```cobol
IF WS-STATUS = "00"
    PERFORM PROCESS-FILE
ELSE
    DISPLAY "OPEN FAILED: " WS-STATUS
END-IF.
```

Multi-way branch:

```cobol
EVALUATE WS-CODE
    WHEN "CRD" ADD WS-AMOUNT TO WS-BALANCE
    WHEN "DBT" SUBTRACT WS-AMOUNT FROM WS-BALANCE
    WHEN OTHER DISPLAY "BAD CODE"
END-EVALUATE.
```

Loop:

```cobol
PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > WS-COUNT
    DISPLAY WS-I
END-PERFORM.
```

## Paragraphs and Sections

Paragraph names label blocks of procedure logic:

```cobol
PROCESS-CUSTOMER.
    ADD 1 TO WS-COUNT.
    PERFORM CALCULATE-BALANCE.
```

Use paragraphs to make business steps obvious. Avoid jumping around randomly.
Modern COBOL style favors structured `PERFORM` blocks and explicit terminators
such as `END-IF` and `END-READ`.

## Copybooks

A copybook is shared source included at compile time:

```cobol
COPY "ACCOUNT-RECORD.cpy".
```

Copybooks usually define:

- record layouts
- constants
- communication areas
- SQLCA or other system structures

Treat copybooks as contracts. If you change a shared copybook, every program
that uses it may be affected.

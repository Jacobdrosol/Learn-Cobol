# Db2, CICS, IMS, and VSAM

These are major parts of the application ecosystem. You do not need production
depth in all of them before applying for junior roles, but you should know what
each one is for.

## VSAM

VSAM is a family of z/OS access methods for record-oriented data sets.

Common types:

- KSDS: key-sequenced data set, accessed by key
- ESDS: entry-sequenced data set, records in arrival order
- RRDS: relative record data set, accessed by relative record number

COBOL programs often use `SELECT`, `FD`, and file I/O verbs to read, write, and
update VSAM files. Local GnuCOBOL can teach file concepts, but real VSAM
behavior must be practiced on z/OS.

## Db2 for z/OS

Db2 is IBM's relational database on z/OS. COBOL programs can use embedded SQL:

```cobol
EXEC SQL
    SELECT BALANCE
      INTO :HV-BALANCE
      FROM ACCOUNT
     WHERE ACCOUNT_ID = :HV-ACCOUNT-ID
END-EXEC.
```

Important concepts:

- tables, rows, columns
- SQLCODE and SQLSTATE
- host variables
- cursors
- commits and rollbacks
- bind packages and plans
- performance and indexing

IBM's Db2 documentation states that applications use SQL statements to perform
data definition or manipulation against Db2 for z/OS objects.

## CICS

CICS is an online transaction processing environment. A user or service starts a
short transaction, CICS manages the environment, and a COBOL program performs
business logic.

Important concepts:

- transaction ID
- program
- COMMAREA or channels and containers
- BMS maps for terminal screens
- pseudo-conversational programming
- syncpoint
- EXEC CICS commands

Batch work is often scheduled and file-oriented. CICS work is request-oriented
and must return quickly.

## IMS

IMS includes a transaction manager and a hierarchical database manager.

Important concepts:

- IMS TM for transaction processing
- IMS DB for hierarchical data
- DL/I calls
- PSB and PCB
- message processing regions

IMS is common in very large, long-lived enterprise systems.

## z/OS Connect and APIs

z/OS Connect exposes z/OS assets as REST APIs and can also let COBOL or PL/I
applications call REST APIs. This matters because many modernization projects
wrap reliable existing systems instead of rewriting them immediately.

## What To Learn First

Order for junior COBOL path:

1. COBOL batch and files
2. JCL and job output
3. Db2 SQL basics
4. VSAM concepts
5. CICS concepts
6. Zowe and modern tooling
7. IMS overview

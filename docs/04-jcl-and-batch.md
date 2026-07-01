# JCL and Batch

JCL is Job Control Language. It tells z/OS what program to run, what resources
to allocate, what files or data sets to use, and where output should go.

Local GnuCOBOL uses shell commands and `make`. z/OS batch uses JCL submitted to
JES.

## Basic JCL Shape

```jcl
//MYJOB    JOB (ACCT),'NAME',CLASS=A,MSGCLASS=X,NOTIFY=&SYSUID
//STEP1    EXEC PGM=MYPROG
//STEPLIB  DD DISP=SHR,DSN=MY.LOADLIB
//INFILE   DD DISP=SHR,DSN=MY.INPUT.DATA
//OUTFILE  DD DISP=(NEW,CATLG,DELETE),DSN=MY.OUTPUT.DATA,
//            SPACE=(CYL,(1,1)),UNIT=SYSDA
//SYSOUT   DD SYSOUT=*
```

Core statements:

- `JOB`: identifies the job and accounting/routing information.
- `EXEC`: runs a program or procedure.
- `DD`: defines a data definition, which connects a program's file name to a
  data set, spool output, temporary data set, or inline data.

## JES and Spool

JES receives jobs, schedules them, and manages output. Developers inspect job
output in tools such as SDSF or equivalent site tooling.

Important output:

- job log
- JCL messages
- system messages
- compiler listing
- program `DISPLAY` output
- return codes
- abend codes

## Return Codes

Return codes are how batch jobs communicate status.

Common convention:

- `0`: success
- `4`: warning, often acceptable
- `8`: error, usually investigate
- `12` or higher: severe error

Exact meaning is site-specific. Always learn local standards.

## Compile, Link, Run

On z/OS, COBOL source is compiled into object code, then bound or linked into a
load module or program object. A later step executes that program.

The sample `jcl/compile-and-run-cobol.jcl` shows this shape, but real shops
usually provide cataloged procedures so developers do not write every compiler
DD statement manually.

## Data Sets

z/OS data sets are not just Unix files. Common forms:

- sequential data set: one stream of records
- partitioned data set: library of members, often source or JCL
- PDSE: modern partitioned data set extended
- VSAM KSDS/ESDS/RRDS: keyed, entry-sequenced, and relative record stores
- USS file: Unix-style file under z/OS UNIX

Data set names often follow strict site rules.

## Batch Reliability

A batch job should be clear about:

- input data sets
- output data sets
- temporary work data sets
- restart behavior
- what to delete or keep on failure
- acceptable return codes
- expected record counts and totals

Good COBOL developers think like operators. They make jobs diagnosable.

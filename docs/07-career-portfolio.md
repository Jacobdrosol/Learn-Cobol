# Career and Portfolio Guide

The goal is to make your learning visible and credible. A junior mainframe
portfolio should show code, tests, operational thinking, and humility about
what still requires real system access.

## Portfolio Projects To Finish

Minimum:

- `projects/batch-payroll`
- `projects/bank-ledger`
- `projects/capstone-core-banking`

Each project should eventually have:

- README with business purpose
- input and output record layouts
- compile/run instructions
- tests
- sample data
- expected output
- JCL sample
- restart and error-handling notes
- list of future z/OS enhancements

## Resume Bullets

Use bullets that are specific:

- Built tested COBOL batch programs with file input, record validation, control totals, and report output using GnuCOBOL.
- Created mainframe-style project structure with copybooks, JCL samples, golden-output tests, and documented restart/error-handling assumptions.
- Studied z/OS batch concepts including JCL JOB/EXEC/DD statements, JES spool output, return codes, data sets, and compiler/link/run flow.
- Completed or actively pursuing IBM Z Xplore and IBM Z Mainframe Skills Depot application developer learning paths.

Do not claim production CICS, Db2, IMS, RACF, or z/OS administration experience
unless you have actually done that work.

## Interview Questions

COBOL:

- What are the four divisions?
- What is `WORKING-STORAGE`?
- What is `LINKAGE SECTION`?
- What is a copybook?
- What is the difference between `PIC 9(5)V99` and `PIC X(7)`?
- Why do numeric edited fields exist?
- What does `ROUNDED` do?
- How do you read a sequential file?

Batch and JCL:

- What is a JOB statement?
- What is an EXEC statement?
- What is a DD statement?
- What is SYSOUT?
- What is a return code?
- What would you inspect when a job fails?
- What is a restart concern?

Ecosystem:

- What is z/OS?
- What is JES?
- What is TSO/ISPF?
- What is USS?
- What is RACF?
- What is Db2 for z/OS?
- What is CICS?
- What is IMS?
- What is VSAM?
- What is Zowe?

Scenario:

- A batch job read 100000 input records yesterday and 40000 today. What do you check?
- A program change adds a field to a copybook. What can break?
- A job ended with return code 8 but produced an output file. What do you do?
- A user says a CICS transaction is slow. What questions do you ask before changing COBOL?

## Job Search Notes

Search terms:

- COBOL developer
- mainframe developer
- z/OS developer
- JCL developer
- CICS developer
- Db2 COBOL
- VSAM COBOL
- mainframe application support
- batch support
- mainframe modernization

Likely employers:

- banks
- insurers
- state and federal agencies
- airlines
- large retailers
- health systems
- payroll and payment processors
- mainframe consulting firms

Remote work exists, but junior remote-only roles are harder. Do not ignore
hybrid or relocation-friendly roles if your priority is breaking into the field.

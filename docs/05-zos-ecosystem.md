# z/OS Ecosystem

Mainframe is not one tool. It is an ecosystem of hardware, operating system,
middleware, security, databases, transaction managers, schedulers, and developer
tools.

## IBM Z

IBM Z is the mainframe hardware platform. It is built for high availability,
large I/O throughput, strong isolation, and enterprise workloads.

## z/OS

z/OS is IBM's flagship mainframe operating system. IBM's product page lists
z/OS 3.2 as the current major release family as of this repo setup.

Core ideas:

- MVS heritage: job, task, address space, data set, catalog, system services
- JES: job entry subsystem for batch work
- TSO/E and ISPF: interactive user environment
- USS: Unix System Services, a POSIX environment inside z/OS
- SDSF: common job output and system display tool
- Language Environment: common runtime for COBOL, PL/I, C, C++, and others

## Security

RACF, ACF2, and Top Secret are common mainframe security managers. RACF is IBM's
security product. Learn these ideas:

- user ID
- group
- data set profile
- resource class
- access levels
- least privilege
- audit trail

Never put credentials in a repository.

## Development Tools

Traditional:

- TSO/ISPF editor
- JCL members in PDS/PDSE libraries
- compile procedures
- SDSF for job output

Modern:

- VS Code
- Zowe Explorer
- Zowe CLI
- Git
- CI/CD integration
- z/OSMF

Zowe is an open-source framework for z/OS tooling. It helps developers use
familiar workstation tools while interacting with mainframe resources.

## Where COBOL Runs

COBOL commonly appears in:

- batch jobs
- CICS online transactions
- IMS transactions
- Db2 applications
- VSAM file processing
- service/API wrappers through modernization tooling

COBOL is rarely alone. The job is usually to maintain reliable business logic
inside a larger operational system.

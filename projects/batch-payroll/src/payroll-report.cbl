       IDENTIFICATION DIVISION.
       PROGRAM-ID. PAYROLL-REPORT.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMPLOYEE-FILE
               ASSIGN TO "projects/batch-payroll/data/employees.csv"
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS WS-FILE-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD  EMPLOYEE-FILE.
       01  EMPLOYEE-LINE              PIC X(120).

       WORKING-STORAGE SECTION.
       01  WS-FILE-STATUS            PIC XX VALUE SPACES.
       01  WS-EOF                    PIC X VALUE "N".
       01  WS-ID                     PIC X(06).
       01  WS-NAME                   PIC X(22).
       01  WS-DEPT                   PIC X(03).
       01  WS-RATE-TEXT              PIC X(12).
       01  WS-HOURS-TEXT             PIC X(12).
       01  WS-RATE                   PIC 9(05)V99 VALUE ZERO.
       01  WS-HOURS                  PIC 9(03)V99 VALUE ZERO.
       01  WS-GROSS                  PIC 9(07)V99 VALUE ZERO.
       01  WS-TAX                    PIC 9(07)V99 VALUE ZERO.
       01  WS-NET                    PIC 9(07)V99 VALUE ZERO.
       01  WS-TOTAL-GROSS            PIC 9(09)V99 VALUE ZERO.
       01  WS-TOTAL-NET              PIC 9(09)V99 VALUE ZERO.
       01  WS-COUNT                  PIC 9(03) VALUE ZERO.
       01  WS-MONEY                  PIC $$$,$$$,$$9.99.

       PROCEDURE DIVISION.
           OPEN INPUT EMPLOYEE-FILE.
           IF WS-FILE-STATUS NOT = "00"
               DISPLAY "ERROR OPENING EMPLOYEES: " WS-FILE-STATUS
               GOBACK
           END-IF.

           DISPLAY "PAYROLL REPORT".
           DISPLAY "ID     NAME                   DEPT GROSS          NET".
           PERFORM UNTIL WS-EOF = "Y"
               READ EMPLOYEE-FILE
                   AT END
                       MOVE "Y" TO WS-EOF
                   NOT AT END
                       PERFORM PROCESS-EMPLOYEE
               END-READ
           END-PERFORM.
           CLOSE EMPLOYEE-FILE.

           MOVE WS-TOTAL-GROSS TO WS-MONEY.
           DISPLAY "TOTAL GROSS: " WS-MONEY.
           MOVE WS-TOTAL-NET TO WS-MONEY.
           DISPLAY "TOTAL NET:   " WS-MONEY.
           DISPLAY "EMPLOYEES: " WS-COUNT.
           GOBACK.

       PROCESS-EMPLOYEE.
           MOVE SPACES TO WS-ID WS-NAME WS-DEPT WS-RATE-TEXT WS-HOURS-TEXT.
           UNSTRING EMPLOYEE-LINE DELIMITED BY ","
               INTO WS-ID WS-NAME WS-DEPT WS-RATE-TEXT WS-HOURS-TEXT
           END-UNSTRING.
           COMPUTE WS-RATE = FUNCTION NUMVAL(WS-RATE-TEXT).
           COMPUTE WS-HOURS = FUNCTION NUMVAL(WS-HOURS-TEXT).
           MULTIPLY WS-RATE BY WS-HOURS GIVING WS-GROSS ROUNDED.
           MULTIPLY WS-GROSS BY .20 GIVING WS-TAX ROUNDED.
           SUBTRACT WS-TAX FROM WS-GROSS GIVING WS-NET.
           ADD 1 TO WS-COUNT.
           ADD WS-GROSS TO WS-TOTAL-GROSS.
           ADD WS-NET TO WS-TOTAL-NET.
           MOVE WS-GROSS TO WS-MONEY.
           DISPLAY WS-ID " " WS-NAME " " WS-DEPT " " WS-MONEY
               WITH NO ADVANCING.
           MOVE WS-NET TO WS-MONEY.
           DISPLAY " " WS-MONEY.

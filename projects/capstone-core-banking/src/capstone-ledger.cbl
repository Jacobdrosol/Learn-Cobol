       IDENTIFICATION DIVISION.
       PROGRAM-ID. CAPSTONE-LEDGER.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ACCOUNT-FILE
               ASSIGN TO "projects/capstone-core-banking/data/accounts.csv"
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS WS-ACCOUNT-STATUS.
           SELECT TRANSACTION-FILE
               ASSIGN TO "projects/capstone-core-banking/data/transactions.csv"
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS WS-TXN-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD  ACCOUNT-FILE.
       01  ACCOUNT-LINE             PIC X(120).
       FD  TRANSACTION-FILE.
       01  TRANSACTION-LINE         PIC X(120).

       WORKING-STORAGE SECTION.
       01  WS-ACCOUNT-STATUS        PIC XX VALUE SPACES.
       01  WS-TXN-STATUS            PIC XX VALUE SPACES.
       01  WS-EOF                   PIC X VALUE "N".
       01  WS-I                     PIC 9(02) VALUE ZERO.
       01  WS-COUNT                 PIC 9(02) VALUE ZERO.
       01  WS-FOUND                 PIC X VALUE "N".
       01  WS-TOTAL-REJECTS         PIC 9(03) VALUE ZERO.
       01  WS-MONEY                 PIC $$$,$$$,$$9.99.
       01  WS-BALANCE-TEXT          PIC X(16).
       COPY "ACCOUNT-RECORD.cpy".
       COPY "TRANSACTION-RECORD.cpy".
       01  ACCOUNT-TABLE.
           05 ACCOUNT-ROW OCCURS 20 TIMES.
              10 TB-ID              PIC X(06).
              10 TB-NAME            PIC X(24).
              10 TB-BALANCE         PIC S9(09)V99.

       PROCEDURE DIVISION.
           PERFORM LOAD-ACCOUNT-MASTER.
           PERFORM POST-TRANSACTIONS.
           PERFORM PRINT-REPORT.
           GOBACK.

       LOAD-ACCOUNT-MASTER.
           OPEN INPUT ACCOUNT-FILE.
           IF WS-ACCOUNT-STATUS NOT = "00"
               DISPLAY "ERROR OPENING ACCOUNT MASTER: " WS-ACCOUNT-STATUS
               GOBACK
           END-IF.
           MOVE "N" TO WS-EOF.
           PERFORM UNTIL WS-EOF = "Y"
               READ ACCOUNT-FILE
                   AT END
                       MOVE "Y" TO WS-EOF
                   NOT AT END
                       ADD 1 TO WS-COUNT
                       MOVE SPACES TO ACCT-ID ACCT-NAME WS-BALANCE-TEXT
                       UNSTRING ACCOUNT-LINE DELIMITED BY ","
                           INTO ACCT-ID ACCT-NAME WS-BALANCE-TEXT
                       END-UNSTRING
                       COMPUTE ACCT-BALANCE =
                           FUNCTION NUMVAL(WS-BALANCE-TEXT)
                       MOVE ACCT-ID TO TB-ID(WS-COUNT)
                       MOVE ACCT-NAME TO TB-NAME(WS-COUNT)
                       MOVE ACCT-BALANCE TO TB-BALANCE(WS-COUNT)
               END-READ
           END-PERFORM.
           CLOSE ACCOUNT-FILE.

       POST-TRANSACTIONS.
           OPEN INPUT TRANSACTION-FILE.
           IF WS-TXN-STATUS NOT = "00"
               DISPLAY "ERROR OPENING TRANSACTIONS: " WS-TXN-STATUS
               GOBACK
           END-IF.
           MOVE "N" TO WS-EOF.
           PERFORM UNTIL WS-EOF = "Y"
               READ TRANSACTION-FILE
                   AT END
                       MOVE "Y" TO WS-EOF
                   NOT AT END
                       PERFORM POST-ONE-TRANSACTION
               END-READ
           END-PERFORM.
           CLOSE TRANSACTION-FILE.

       POST-ONE-TRANSACTION.
           MOVE SPACES TO TXN-ACCT-ID TXN-CODE.
           MOVE ZERO TO TXN-AMOUNT.
           MOVE SPACES TO WS-BALANCE-TEXT.
           UNSTRING TRANSACTION-LINE DELIMITED BY ","
               INTO TXN-ACCT-ID TXN-CODE WS-BALANCE-TEXT
           END-UNSTRING.
           COMPUTE TXN-AMOUNT = FUNCTION NUMVAL(WS-BALANCE-TEXT).
           IF TXN-CODE = "DBT"
               MULTIPLY -1 BY TXN-AMOUNT GIVING TXN-AMOUNT
           END-IF.
           MOVE "N" TO WS-FOUND.
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > WS-COUNT
               IF TB-ID(WS-I) = TXN-ACCT-ID
                   ADD TXN-AMOUNT TO TB-BALANCE(WS-I)
                   MOVE "Y" TO WS-FOUND
               END-IF
           END-PERFORM.
           IF WS-FOUND NOT = "Y"
               ADD 1 TO WS-TOTAL-REJECTS
               DISPLAY "CAPSTONE REJECT: " TXN-ACCT-ID " " TXN-CODE
           END-IF.

       PRINT-REPORT.
           DISPLAY "CAPSTONE CORE BANKING POSTING".
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > WS-COUNT
               MOVE TB-BALANCE(WS-I) TO WS-MONEY
               DISPLAY TB-ID(WS-I) " " TB-NAME(WS-I) " " WS-MONEY
           END-PERFORM.
           DISPLAY "REJECTS: " WS-TOTAL-REJECTS.

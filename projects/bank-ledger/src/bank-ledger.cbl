       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK-LEDGER.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ACCOUNT-FILE
               ASSIGN TO "projects/bank-ledger/data/accounts.csv"
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS WS-ACCOUNT-STATUS.
           SELECT TRANSACTION-FILE
               ASSIGN TO "projects/bank-ledger/data/transactions.csv"
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
       01  WS-ID                    PIC X(06).
       01  WS-NAME                  PIC X(24).
       01  WS-AMOUNT-TEXT           PIC X(16).
       01  WS-AMOUNT                PIC S9(09)V99 VALUE ZERO.
       01  WS-I                     PIC 9(02) VALUE ZERO.
       01  WS-COUNT                 PIC 9(02) VALUE ZERO.
       01  WS-FOUND                 PIC X VALUE "N".
       01  WS-MONEY                 PIC $$$,$$$,$$9.99.
       01  ACCOUNT-TABLE.
           05 ACCOUNT-ROW OCCURS 20 TIMES.
              10 TB-ID              PIC X(06).
              10 TB-NAME            PIC X(24).
              10 TB-BALANCE         PIC S9(09)V99.

       PROCEDURE DIVISION.
           PERFORM LOAD-ACCOUNTS.
           PERFORM APPLY-TRANSACTIONS.
           PERFORM PRINT-REPORT.
           GOBACK.

       LOAD-ACCOUNTS.
           OPEN INPUT ACCOUNT-FILE.
           IF WS-ACCOUNT-STATUS NOT = "00"
               DISPLAY "ERROR OPENING ACCOUNTS: " WS-ACCOUNT-STATUS
               GOBACK
           END-IF.
           MOVE "N" TO WS-EOF.
           PERFORM UNTIL WS-EOF = "Y"
               READ ACCOUNT-FILE
                   AT END
                       MOVE "Y" TO WS-EOF
                   NOT AT END
                       ADD 1 TO WS-COUNT
                       MOVE SPACES TO WS-ID WS-NAME WS-AMOUNT-TEXT
                       UNSTRING ACCOUNT-LINE DELIMITED BY ","
                           INTO WS-ID WS-NAME WS-AMOUNT-TEXT
                       END-UNSTRING
                       MOVE WS-ID TO TB-ID(WS-COUNT)
                       MOVE WS-NAME TO TB-NAME(WS-COUNT)
                       COMPUTE TB-BALANCE(WS-COUNT) =
                           FUNCTION NUMVAL(WS-AMOUNT-TEXT)
               END-READ
           END-PERFORM.
           CLOSE ACCOUNT-FILE.

       APPLY-TRANSACTIONS.
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
                       PERFORM APPLY-ONE-TRANSACTION
               END-READ
           END-PERFORM.
           CLOSE TRANSACTION-FILE.

       APPLY-ONE-TRANSACTION.
           MOVE SPACES TO WS-ID WS-AMOUNT-TEXT.
           MOVE ZERO TO WS-AMOUNT.
           UNSTRING TRANSACTION-LINE DELIMITED BY ","
               INTO WS-ID WS-AMOUNT-TEXT
           END-UNSTRING.
           COMPUTE WS-AMOUNT = FUNCTION NUMVAL(WS-AMOUNT-TEXT).
           MOVE "N" TO WS-FOUND.
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > WS-COUNT
               IF TB-ID(WS-I) = WS-ID
                   ADD WS-AMOUNT TO TB-BALANCE(WS-I)
                   MOVE "Y" TO WS-FOUND
               END-IF
           END-PERFORM.
           IF WS-FOUND NOT = "Y"
               DISPLAY "REJECT UNKNOWN ACCOUNT: " WS-ID
           END-IF.

       PRINT-REPORT.
           DISPLAY "BANK LEDGER FINAL BALANCES".
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > WS-COUNT
               MOVE TB-BALANCE(WS-I) TO WS-MONEY
               DISPLAY TB-ID(WS-I) " " TB-NAME(WS-I) " " WS-MONEY
           END-PERFORM.

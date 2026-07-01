       IDENTIFICATION DIVISION.
       PROGRAM-ID. TABLE-SEARCH.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-TARGET-ACCOUNT        PIC X(05) VALUE "A103".
       01  WS-FOUND                 PIC X VALUE "N".
       01  WS-IDX                   PIC 9 VALUE 1.
       01  WS-MONEY                 PIC $$$,$$9.99.
       01  ACCOUNT-TABLE.
           05 ACCOUNT-ENTRY OCCURS 5 TIMES.
              10 ACCOUNT-ID         PIC X(05).
              10 ACCOUNT-NAME       PIC X(16).
              10 ACCOUNT-BALANCE    PIC 9(08)V99.

       PROCEDURE DIVISION.
           MOVE "A101" TO ACCOUNT-ID(1).
           MOVE "CHECKING" TO ACCOUNT-NAME(1).
           MOVE 001250.25 TO ACCOUNT-BALANCE(1).
           MOVE "A102" TO ACCOUNT-ID(2).
           MOVE "SAVINGS" TO ACCOUNT-NAME(2).
           MOVE 010900.00 TO ACCOUNT-BALANCE(2).
           MOVE "A103" TO ACCOUNT-ID(3).
           MOVE "PAYROLL" TO ACCOUNT-NAME(3).
           MOVE 120000.00 TO ACCOUNT-BALANCE(3).
           MOVE "A104" TO ACCOUNT-ID(4).
           MOVE "TAX" TO ACCOUNT-NAME(4).
           MOVE 003450.75 TO ACCOUNT-BALANCE(4).
           MOVE "A105" TO ACCOUNT-ID(5).
           MOVE "RESERVE" TO ACCOUNT-NAME(5).
           MOVE 025000.00 TO ACCOUNT-BALANCE(5).

           PERFORM VARYING WS-IDX FROM 1 BY 1 UNTIL WS-IDX > 5
               IF ACCOUNT-ID(WS-IDX) = WS-TARGET-ACCOUNT
                   MOVE "Y" TO WS-FOUND
                   MOVE ACCOUNT-BALANCE(WS-IDX) TO WS-MONEY
                   DISPLAY "FOUND: " ACCOUNT-ID(WS-IDX)
                       " " ACCOUNT-NAME(WS-IDX) " " WS-MONEY
               END-IF
           END-PERFORM.

           IF WS-FOUND NOT = "Y"
               DISPLAY "ACCOUNT NOT FOUND: " WS-TARGET-ACCOUNT
           END-IF.
           GOBACK.

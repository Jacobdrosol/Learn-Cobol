       IDENTIFICATION DIVISION.
       PROGRAM-ID. SORT-TRANSACTIONS.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-I                  PIC 9 VALUE 1.
       01  WS-J                  PIC 9 VALUE 1.
       01  WS-MONEY              PIC $$$,$$9.99.
       01  TXN-TABLE.
           05 TXN OCCURS 5 TIMES.
              10 TXN-ACCOUNT     PIC X(05).
              10 TXN-AMOUNT      PIC 9(05)V99.
       01  TEMP-TXN.
           05 TEMP-ACCOUNT       PIC X(05).
           05 TEMP-AMOUNT        PIC 9(05)V99.

       PROCEDURE DIVISION.
           MOVE "A200" TO TXN-ACCOUNT(1).
           MOVE 0100.00 TO TXN-AMOUNT(1).
           MOVE "A100" TO TXN-ACCOUNT(2).
           MOVE 0025.50 TO TXN-AMOUNT(2).
           MOVE "A300" TO TXN-ACCOUNT(3).
           MOVE 0300.00 TO TXN-AMOUNT(3).
           MOVE "A100" TO TXN-ACCOUNT(4).
           MOVE 0010.00 TO TXN-AMOUNT(4).
           MOVE "A200" TO TXN-ACCOUNT(5).
           MOVE 0075.25 TO TXN-AMOUNT(5).

           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 4
               PERFORM VARYING WS-J FROM WS-I BY 1 UNTIL WS-J > 5
                   IF TXN-ACCOUNT(WS-J) < TXN-ACCOUNT(WS-I)
                       PERFORM SWAP-ROWS
                   ELSE
                       IF TXN-ACCOUNT(WS-J) = TXN-ACCOUNT(WS-I)
                          AND TXN-AMOUNT(WS-J) < TXN-AMOUNT(WS-I)
                           PERFORM SWAP-ROWS
                       END-IF
                   END-IF
               END-PERFORM
           END-PERFORM.

           DISPLAY "SORTED TRANSACTIONS".
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 5
               MOVE TXN-AMOUNT(WS-I) TO WS-MONEY
               DISPLAY TXN-ACCOUNT(WS-I) " " WS-MONEY
           END-PERFORM.
           GOBACK.

       SWAP-ROWS.
           MOVE TXN(WS-I) TO TEMP-TXN.
           MOVE TXN(WS-J) TO TXN(WS-I).
           MOVE TEMP-TXN TO TXN(WS-J).

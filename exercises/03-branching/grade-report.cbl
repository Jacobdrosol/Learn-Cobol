       IDENTIFICATION DIVISION.
       PROGRAM-ID. GRADE-REPORT.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT GRADE-FILE ASSIGN TO "exercises/03-branching/grades.dat"
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS WS-FILE-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD  GRADE-FILE.
       01  GRADE-LINE          PIC X(80).

       WORKING-STORAGE SECTION.
       01  WS-FILE-STATUS      PIC XX VALUE SPACES.
       01  WS-EOF              PIC X VALUE "N".
       01  WS-NAME             PIC X(20).
       01  WS-SCORE-TEXT       PIC X(10).
       01  WS-SCORE            PIC 9(03) VALUE ZERO.
       01  WS-COUNT            PIC 9(03) VALUE ZERO.
       01  WS-PASSED           PIC 9(03) VALUE ZERO.
       01  WS-FAILED           PIC 9(03) VALUE ZERO.
       01  WS-AVERAGE          PIC 9(03)V99 VALUE ZERO.
       01  WS-TOTAL            PIC 9(05) VALUE ZERO.
       01  WS-AVG-OUT          PIC ZZ9.99.

       PROCEDURE DIVISION.
           OPEN INPUT GRADE-FILE.
           IF WS-FILE-STATUS NOT = "00"
               DISPLAY "ERROR OPENING GRADES: " WS-FILE-STATUS
               GOBACK
           END-IF.

           DISPLAY "GRADE REPORT".
           PERFORM UNTIL WS-EOF = "Y"
               READ GRADE-FILE
                   AT END
                       MOVE "Y" TO WS-EOF
                   NOT AT END
                       PERFORM PROCESS-GRADE
               END-READ
           END-PERFORM.
           CLOSE GRADE-FILE.

           IF WS-COUNT > ZERO
               DIVIDE WS-TOTAL BY WS-COUNT GIVING WS-AVERAGE ROUNDED
           END-IF.
           MOVE WS-AVERAGE TO WS-AVG-OUT.
           DISPLAY "STUDENTS: " WS-COUNT.
           DISPLAY "PASSED: " WS-PASSED.
           DISPLAY "FAILED: " WS-FAILED.
           DISPLAY "AVERAGE: " WS-AVG-OUT.
           GOBACK.

       PROCESS-GRADE.
           MOVE SPACES TO WS-NAME WS-SCORE-TEXT.
           UNSTRING GRADE-LINE DELIMITED BY ","
               INTO WS-NAME WS-SCORE-TEXT
           END-UNSTRING.
           COMPUTE WS-SCORE = FUNCTION NUMVAL(WS-SCORE-TEXT).
           ADD 1 TO WS-COUNT.
           ADD WS-SCORE TO WS-TOTAL.
           IF WS-SCORE >= 70
               ADD 1 TO WS-PASSED
               DISPLAY WS-NAME " PASS " WS-SCORE
           ELSE
               ADD 1 TO WS-FAILED
               DISPLAY WS-NAME " REVIEW " WS-SCORE
           END-IF.

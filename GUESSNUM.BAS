REM made by Shaw Kai (c) 2020

DECLARE SUB TitleScreen ()
DECLARE SUB PlayAgain (Game AS STRING)
TYPE Menu: level AS STRING * 25: Discription AS STRING * 50: END TYPE
TYPE Difficulty: level AS LONG: Tries AS INTEGER: END TYPE

REM  declares the varibles used in the program
DIM cursery AS INTEGER, opt AS INTEGER, optmax AS INTEGER: optmax = 10
DIM Anwser AS LONG, Guess AS LONG, Last AS STRING * 10
DIM SHARED Difficulty(optmax) AS Difficulty, Menu(optmax) AS Menu

OPEN "MenuData.dat" FOR INPUT AS #1
FOR i = 0 TO optmax - 1
    INPUT #1, Menu(i).level: INPUT #1, Menu(i).Discription
    INPUT #1, Difficulty(i).level: INPUT #1, Difficulty(i).Tries
NEXT:  CLOSE
                                 
CALL TitleScreen
DMenu:
    CLS : LOCATE 2, 1
    FOR i = 0 TO optmax - 1
        COLOR 7: PRINT i + 1; ":"; Menu(i).level
        COLOR 14: PRINT Menu(i).Discription
    NEXT
    COLOR 7: LOCATE 1, 1: INPUT "select difficulty or press Enter to quit: ", opt
    IF 0 > opt OR opt > optmax THEN GOTO DMenu
    IF opt = 0 THEN CLS : PlayAgain ("Quit")
Setup:
    RANDOMIZE TIMER / 3: Answer = INT(RND * Difficulty(opt - 1).level) + 1
    Tries = Difficulty(opt - 1).Tries:
    WHILE Tries > 0
InputGuess:
        CLS : COLOR 2
        PRINT "Between 1 and "; Difficulty(opt - 1).level, Menu(opt - 1).level
        PRINT "Last Guess was "; Guess; " and was "; Last
        PRINT "Tries Remaining: "; Tries', Answer
        COLOR 7: INPUT "Guess a number: ", Guess
        IF Guess = 0 THEN GOTO InputGuess
        Tries = Tries - 1
        SELECT CASE Guess
            CASE Answer
                PlayAgain ("Win"): GOTO DMenu
            CASE IS < Answer
                Last = "To low"
            CASE IS > Answer
                Last = "To high"
        END SELECT
    WEND
    PlayAgain ("Lose"): GOTO DMenu

SUB PlayAgain (Game AS STRING)
DIM Again AS STRING, test AS STRING
WHILE UCASE$(Again) <> "Y" AND UCASE$(Again) <> "YES"
    SELECT CASE Game
        CASE "Win"
            COLOR 2
            PRINT "�������������������������������������������������˻"
            PRINT "�� � � ��� � � ���   �   �  ��  � ��  � ��� ���  ��"
            PRINT "�� ��� � � � � ���   � � ���� � � � � � ��  ���  ��"
            PRINT "��  �  ��� ��� � ��  ��������  �� �  �� ��� � �� ��"
            PRINT "�������������������������������������������������ʼ"
        CASE "Lose"
            COLOR 4
            PRINT "�������������������������������������������������˻"
            PRINT "��   � � ��� � � ���    ���   �   ��� ���� ���   ��"
            PRINT "��   ��� � � � � ���    ���   �   � � ���� ��    ��"
            PRINT "��    �  ��� ��� � ��   � �   ��� ��� ���� ���   ��"
            PRINT "�������������������������������������������������ʼ"
        CASE "Quit"
            COLOR 7
            PRINT "�������������������������������������������������˻"
            PRINT "��         ����� ��� ���� ���   ���� � �         ��"
            PRINT "��         � � � ��� �  � ��    ���  ���         ��"
            PRINT "��         �   � � � ���� ���   ����  �          ��"
            PRINT "��                                               ��"
            PRINT "��     � �� � � �   ���   ���� � � ��� �   �     ��"
            PRINT "��     ��   ��� �   ��    ���� ��� ��� � � �     ��"
            PRINT "��     � ��  �  ��� ���   ���� � � � � �����     ��"
            PRINT "�������������������������������������������������ʼ"
            PRINT "press space to continue"
            WHILE INKEY$ <> CHR$(32)
            WEND: END
    END SELECT
    INPUT "Continue playing [Y]es/[N]o :", Again
    IF UCASE$(Again) = "N" OR UCASE$(Again) = "NO" THEN PlayAgain ("Quit")
WEND
END SUB

SUB TitleScreen
    CLS : COLOR 7
           '0       '10       '20       '30       '40
    PRINT "�������������������������������������������������˻"  '01
    PRINT "��                                               ��"  '02
    PRINT "��    ���� � � ��� ���� ����                     ��"  '03
    PRINT "��    � �� � � ��  ���� ����                     ��"  '04
    PRINT "��    ���� ��� ��� ���� ����                     ��"  '05
    PRINT "��                                               ��"  '06
    PRINT "��             ����� � � ���                     ��"  '07
    PRINT "��               �   ��� ��                      ��"  '08
    PRINT "��               �   � � ���                     ��"  '09
    PRINT "��                                               ��"  '10
    PRINT "��               ��  � � � ����� ���� ��� ���    ��"  '11
    PRINT "��               � � � � � � � � ���  ��  ���    ��"  '12
    PRINT "��               �  �� ��� �   � ���� ��� � �    ��"  '13
    PRINT "��                                               ��"  '14
    PRINT "��        Select a number between 1 and 9        ��"  '15
    PRINT "�������������������������������������������������ʼ"  '16

    COLOR 12
    LOCATE 3, 3:  PRINT "    ���� � � ��� ���� ����                     "
    LOCATE 4, 3:  PRINT "    � �� � � ��  ���� ����                     "
    LOCATE 5, 3:  PRINT "    ���� ��� ��� ���� ����                     "

    COLOR 10
    LOCATE 7, 3:  PRINT "             ����� � � ���                     "
    LOCATE 8, 3:  PRINT "               �   ��� ��                      "
    LOCATE 9, 3:  PRINT "               �   � � ���                     "

    COLOR 9
    LOCATE 11, 3: PRINT "               ��  � � � ����� ���� ��� ���    "
    LOCATE 12, 3: PRINT "               � � � � � � � � ���  ��  ���    "
    LOCATE 13, 3: PRINT "               �  �� ��� �   � ���� ��� � �    "

    WHILE K$ <> "9" AND INKEY$ <> "8" AND K$ <> "7" AND K$ <> "6" AND K$ <> "5" AND K$ <> "4" AND K$ <> "3" AND K$ <> "2" AND K$ <> "1"
        K$ = INKEY$
    WEND
    COLOR 7: LOCATE 17, 1
    RANDOMIZE TIMER / 3: PRINT "Was it"; INT(RND * 9) + 1; "?"
    PRINT "press space to continue"
    WHILE INKEY$ <> CHR$(32)
    WEND
END SUB

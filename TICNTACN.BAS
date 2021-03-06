REM made by Shaw Kai (c) 2020

DECLARE SUB TitleScreen ()
DECLARE SUB DrawBoard (Player AS INTEGER, Draws AS INTEGER, Computer AS INTEGER)
DECLARE SUB FindMove (Player AS INTEGER, Computer AS INTEGER)
DECLARE SUB GameEnd (Game AS STRING)
DECLARE FUNCTION CheckComputerWin! () : DECLARE FUNCTION CheckPlayerWin! ()
DECLARE FUNCTION CheckGameDraw! ()
DECLARE FUNCTION FindWin! () : DECLARE FUNCTION FindLose! ()
DECLARE FUNCTION FindCenter! ()
COMMON SHARED GameBoard() AS INTEGER: DIM GameBoard(3, 3) AS INTEGER
DIM ScorePlayer AS INTEGER, ScoreDraw AS INTEGER, ScoreComputer AS INTEGER
'����������������������������������������������������������������������˻
SCREEN 13                                                             '��
CALL TitleScreen                                                      '��
FieldInit:                                                            '��
REM Clear the field                                                   '��
    FOR I = 0 TO 2: FOR J = 0 TO 2: GameBoard(I, J) = 0: NEXT: NEXT   '��
    DO                                                                '��
        CALL DrawBoard(ScorePlayer, ScoreDraw, ScoreComputer)         '��
        GOSUB FieldCheck                                              '��
    LOOP                                                              '��
'����������������������������������������������������������������������ʼ
'����������������������������������������������������������������������˻
FieldCheck:     'checks the coordinates of the input                  '��
    COLOR 14: LOCATE 21, 1: PRINT "Type the coordinates(9,9) to Quit" '��
REM Find the position                                                 '��
    COLOR 7: LOCATE 20, 1: INPUT "Type in coordinates(X,Y)"; I, J     '��
    IF I = 9 AND J = 9 THEN CALL GameEnd("Quit")                      '��
REM check if it exists and is empty                                   '��
    IF I < 0 OR I > 2 OR J < 0 OR J > 2 THEN                          '��
       CALL DrawBoard(ScorePlayer, ScoreDraw, ScoreComputer)          '��
       GOTO FieldCheck                                                '��
    END IF                                                            '��
    IF GameBoard(I, J) <> 0 THEN                                      '��
       CALL DrawBoard(ScorePlayer, ScoreDraw, ScoreComputer)          '��
       GOTO FieldCheck                                                '��
    END IF                                                            '��
REM Set the stone                                                     '��
    GameBoard(I, J) = 1: BEEP                                         '��
    GOSUB CheckEnd                                                    '��
REM Let the computer make a move                                      '��
    CALL FindMove(ScorePlayer, ScoreComputer)                         '��
    GOSUB CheckEnd                                                    '��
RETURN                                                                '��
CheckEnd:       'checks if the game has ended                         '��
    CALL DrawBoard(ScorePlayer, ScoreDraw, ScoreComputer)             '��
REM Check whether the player did win                                  '��
    IF CheckPlayerWin THEN                                            '��
        ScorePlayer = ScorePlayer + 1: BEEP                           '��
        CALL GameEnd("Win"): GOTO FieldInit                           '��
    END IF                                                            '��
REM Check whether the computer did win                                '��
    IF CheckComputerWin THEN                                          '��
        ScoreComputer = ScoreComputer + 1: BEEP                       '��
        CALL GameEnd("Lose"): GOTO FieldInit                          '��
    END IF                                                            '��
REM Check whether there is a draw                                     '��
    IF CheckGameDraw THEN                                             '��
        ScoreDraw = ScoreDraw + 1: BEEP                               '��
        CALL GameEnd("Draw"): GOTO FieldInit                          '��
    END IF                                                            '��
RETURN                                                                '��
'����������������������������������������������������������������������ʼ

FUNCTION CheckComputerWin
    IF GameBoard(0, 0) = 2 AND GameBoard(0, 1) = 2 AND GameBoard(0, 2) = 2 THEN
        CheckComputerWin = 1: EXIT FUNCTION
    END IF
    IF GameBoard(1, 0) = 2 AND GameBoard(1, 1) = 2 AND GameBoard(1, 2) = 2 THEN
        CheckComputerWin = 1: EXIT FUNCTION
    END IF
    IF GameBoard(2, 0) = 2 AND GameBoard(2, 1) = 2 AND GameBoard(2, 2) = 2 THEN
       CheckComputerWin = 1: EXIT FUNCTION
    END IF
    IF GameBoard(0, 0) = 2 AND GameBoard(1, 0) = 2 AND GameBoard(2, 0) = 2 THEN
       CheckComputerWin = 1: EXIT FUNCTION
    END IF
    IF GameBoard(0, 1) = 2 AND GameBoard(1, 1) = 2 AND GameBoard(2, 1) = 2 THEN
       CheckComputerWin = 1: EXIT FUNCTION
    END IF
    IF GameBoard(0, 2) = 2 AND GameBoard(1, 2) = 2 AND GameBoard(2, 2) = 2 THEN
       CheckComputerWin = 1: EXIT FUNCTION
    END IF
    IF GameBoard(0, 0) = 2 AND GameBoard(1, 1) = 2 AND GameBoard(2, 2) = 2 THEN
       CheckComputerWin = 1: EXIT FUNCTION
    END IF
    IF GameBoard(0, 2) = 2 AND GameBoard(1, 1) = 2 AND GameBoard(2, 0) = 2 THEN
       CheckComputerWin = 1: EXIT FUNCTION
    END IF
    CheckComputerWin = 0
END FUNCTION

FUNCTION CheckGameDraw
    FOR I = 0 TO 2
        FOR J = 0 TO 2
            IF GameBoard(I, J) = 0 THEN CheckGameDraw = 0: EXIT FUNCTION
        NEXT
    NEXT
    CheckGameDraw = 1
END FUNCTION

FUNCTION CheckPlayerWin
    IF GameBoard(0, 0) = 1 AND GameBoard(0, 1) = 1 AND GameBoard(0, 2) = 1 THEN
        CheckPlayerWin = 1: EXIT FUNCTION
    END IF
    IF GameBoard(1, 0) = 1 AND GameBoard(1, 1) = 1 AND GameBoard(1, 2) = 1 THEN
        CheckPlayerWin = 1: EXIT FUNCTION
    END IF
    IF GameBoard(2, 0) = 1 AND GameBoard(2, 1) = 1 AND GameBoard(2, 2) = 1 THEN
        CheckPlayerWin = 1: EXIT FUNCTION
    END IF
    IF GameBoard(0, 0) = 1 AND GameBoard(1, 0) = 1 AND GameBoard(2, 0) = 1 THEN
        CheckPlayerWin = 1: EXIT FUNCTION
    END IF
    IF GameBoard(0, 1) = 1 AND GameBoard(1, 1) = 1 AND GameBoard(2, 1) = 1 THEN
        CheckPlayerWin = 1: EXIT FUNCTION
    END IF
    IF GameBoard(0, 2) = 1 AND GameBoard(1, 2) = 1 AND GameBoard(2, 2) = 1 THEN
       CheckPlayerWin = 1: EXIT FUNCTION
    END IF
    IF GameBoard(0, 0) = 1 AND GameBoard(1, 1) = 1 AND GameBoard(2, 2) = 1 THEN
        CheckPlayerWin = 1: EXIT FUNCTION
    END IF
    IF GameBoard(0, 2) = 1 AND GameBoard(1, 1) = 1 AND GameBoard(2, 0) = 1 THEN
        CheckPlayerWin = 1: EXIT FUNCTION
    END IF
    CheckPlayerWin = 0
END FUNCTION

SUB DrawBoard (Player AS INTEGER, Draws AS INTEGER, Computer AS INTEGER)
REM Draws the Game Board
CLS : COLOR 7
REM Draws the grid
LINE (50, 0)-(50, 150): LINE (100, 0)-(100, 150)
LINE (0, 50)-(150, 50): LINE (0, 100)-(150, 100)
LINE (0, 0)-(150, 150), , B
    FOR I = 0 TO 2
        FOR J = 0 TO 2
            SELECT CASE GameBoard(I, J)
                CASE IS = 1
                    COLOR 1
                    LOCATE I * 6 + 2, J * 6 + 2: PRINT "� �"
                    LOCATE I * 6 + 3, J * 6 + 2: PRINT " � "
                    LOCATE I * 6 + 4, J * 6 + 2: PRINT "� �"
                CASE IS = 2
                    COLOR 4
                    LOCATE I * 6 + 2, J * 6 + 2: PRINT "���"
                    LOCATE I * 6 + 3, J * 6 + 2: PRINT "� � "
                    LOCATE I * 6 + 4, J * 6 + 2: PRINT "���"
                CASE ELSE
                    COLOR 7
                    LOCATE I * 6 + 2, J * 6 + 2: PRINT I
                    LOCATE I * 6 + 3, J * 6 + 2: PRINT J
            END SELECT
        NEXT
    NEXT
REM Prints out the scores
    COLOR 1: LOCATE 1, 20: PRINT "Player Wins:"; Player
    COLOR 4: LOCATE 2, 20: PRINT "Computer Wins:"; Computer
    COLOR 7: LOCATE 3, 20: PRINT "Draws:"; Draws
END SUB

FUNCTION FindCenter
    IF RND * 2 < 1 AND GameBoard(1, 1) = 0 THEN
        GameBoard(1, 1) = 2: FindCenter = 1: EXIT FUNCTION
    END IF
    FindCenter = 0
END FUNCTION

FUNCTION FindLose
    FOR I = 0 TO 2
        FOR J = 0 TO 2
            IF GameBoard(I, J) = 0 THEN
                GameBoard(I, J) = 1
                IF CheckPlayerWin = 1 THEN
                    GameBoard(I, J) = 2: FindLose = 1: EXIT FUNCTION
                END IF
                GameBoard(I, J) = 0
            END IF
        NEXT
    NEXT
    FindLose = 0
END FUNCTION

SUB FindMove (Player AS INTEGER, Computer AS INTEGER)
FindMove:                                           
    RANDOMIZE TIMER / 3
    level = (Player + 1) / (Computer + 1)
    IF level > .5 THEN IF FindWin = 1 THEN EXIT SUB
    IF level > .8 THEN IF FindLose = 1 THEN EXIT SUB
    IF level > 1.2 THEN IF FindCenter = 1 THEN EXIT SUB
    WHILE 1
        I = INT(RND * 3): J = INT(RND * 3)
        IF GameBoard(I, J) = 0 THEN GameBoard(I, J) = 2: EXIT SUB
    WEND
END SUB

FUNCTION FindWin
    FOR I = 0 TO 2
        FOR J = 0 TO 2
            IF GameBoard(I, J) = 0 THEN
                GameBoard(I, J) = 2
                IF CheckComputerWin = 1 THEN
                    GameBoard(I, J) = 2: FindWin = 1: EXIT FUNCTION
                END IF
                GameBoard(I, J) = 0
            END IF
        NEXT
    NEXT
    FindWin = 0
END FUNCTION

SUB GameEnd (Game AS STRING)
    SELECT CASE Game
        CASE "Win"
            COLOR 2
            PRINT "��������������������������������������˻"
            PRINT "��  � � ��� � � ���                   ��"
            PRINT "��  ��� � � � � ���                   ��"
            PRINT "��   �  ��� ��� � ��                  ��"
            PRINT "��                                    ��"
            PRINT "��       �   �  ��  � ��  � ��� ���   ��"
            PRINT "��       � � ���� � � � � � ��  ���   ��"
            PRINT "��       ��������  �� �  �� ��� � ��  ��"
            PRINT "��������������������������������������ʼ"
            SLEEP 1'0       '10       '20       '30       '40
        CASE "Lose"
            COLOR 4
            PRINT "��������������������������������������˻"
            PRINT "��  � � ��� � � ���                   ��"
            PRINT "��  ��� � � � � ���                   ��"
            PRINT "��   �  ��� ��� � ��                  ��"
            PRINT "��                                    ��"
            PRINT "��            ���   �   ��� ���� ���  ��"
            PRINT "��            ���   �   � � ���� ��   ��"
            PRINT "��            � �   ��� ��� ���� ���  ��"
            PRINT "��������������������������������������ʼ"
            SLEEP 1'0       '10       '20       '30       '40
        CASE "Draw"
            COLOR 7
            PRINT "��������������������������������������˻"
            PRINT "��  ���   ���� ��� �����              ��"
            PRINT "��  ���   �    ���   �                ��"
            PRINT "��  � �   ���� � �   �                ��"
            PRINT "��                                    ��"
            PRINT "��                ���� ��� ����� ���  ��"
            PRINT "��                � �� ��� � � � ��   ��"
            PRINT "��                ���� � � �   � ���  ��"
            PRINT "��������������������������������������ʼ"
            SLEEP 1'0       '10       '20       '30       '40
        CASE "Quit"
            CLS : COLOR 7
            PRINT "��������������������������������������˻"
            PRINT "��    ����� ��� ���� ���  ���� � �    ��"
            PRINT "��    � � � ��� �  � ��   ���  ���    ��"
            PRINT "��    �   � � � ���� ���  ����  �     ��"
            PRINT "��                                    ��"
            PRINT "�� � �� � � �   ���  ����� ���� �   � ��"
            PRINT "�� ��   ��� �   ��   ���������� � � � ��"
            PRINT "�� � ��  �  ��� ���  ����� �� � ����� ��"
            PRINT "��������������������������������������ʼ"
                   '0       '10       '20       '30       '40
            PRINT "Press Space to continue"
            WHILE INKEY$ <> CHR$(32)
            WEND: END

    END SELECT
END SUB

SUB TitleScreen
    CLS : COLOR 7
    PRINT "��������������������������������������˻" '01
    PRINT "��                                    ��" '02
    PRINT "��  ����� � �����                     ��" '03
    PRINT "��    �   � �                         ��" '04
    PRINT "��    �   � �����                     ��" '05
    PRINT "��                                    ��" '06
    PRINT "��          ����� ��� �����           ��" '07
    PRINT "��            �   ��� �               ��" '08
    PRINT "��            �   � � �����           ��" '09
    PRINT "��                                    ��" '10
    PRINT "��                    ����� ��� ���   ��" '11
    PRINT "��                      �   � � ��    ��" '12
    PRINT "��                      �   ��� ���   ��" '13
    PRINT "��                                    ��" '14
    PRINT "��       press space to continue      ��" '15
    PRINT "��������������������������������������ʼ" '16
           '0       '10       '20       '30       '40
    COLOR 1
    LOCATE 3, 3: PRINT "  ����� � �����                     "
    LOCATE 4, 3: PRINT "    �   � �                         "
    LOCATE 5, 3: PRINT "    �   � �����                     "
    COLOR 4
    LOCATE 11, 3: PRINT "                    ����� ��� ���   "
    LOCATE 12, 3: PRINT "                      �   � � ��    "
    LOCATE 13, 3: PRINT "                      �   ��� ���   "

    WHILE INKEY$ <> CHR$(32)
    WEND
END SUB


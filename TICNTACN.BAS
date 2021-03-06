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
'ษหออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออหป
SCREEN 13                                                             'บบ
CALL TitleScreen                                                      'บบ
FieldInit:                                                            'บบ
REM Clear the field                                                   'บบ
    FOR I = 0 TO 2: FOR J = 0 TO 2: GameBoard(I, J) = 0: NEXT: NEXT   'บบ
    DO                                                                'บบ
        CALL DrawBoard(ScorePlayer, ScoreDraw, ScoreComputer)         'บบ
        GOSUB FieldCheck                                              'บบ
    LOOP                                                              'บบ
'ศสออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออสผ
'ษหออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออหป
FieldCheck:     'checks the coordinates of the input                  'บบ
    COLOR 14: LOCATE 21, 1: PRINT "Type the coordinates(9,9) to Quit" 'บบ
REM Find the position                                                 'บบ
    COLOR 7: LOCATE 20, 1: INPUT "Type in coordinates(X,Y)"; I, J     'บบ
    IF I = 9 AND J = 9 THEN CALL GameEnd("Quit")                      'บบ
REM check if it exists and is empty                                   'บบ
    IF I < 0 OR I > 2 OR J < 0 OR J > 2 THEN                          'บบ
       CALL DrawBoard(ScorePlayer, ScoreDraw, ScoreComputer)          'บบ
       GOTO FieldCheck                                                'บบ
    END IF                                                            'บบ
    IF GameBoard(I, J) <> 0 THEN                                      'บบ
       CALL DrawBoard(ScorePlayer, ScoreDraw, ScoreComputer)          'บบ
       GOTO FieldCheck                                                'บบ
    END IF                                                            'บบ
REM Set the stone                                                     'บบ
    GameBoard(I, J) = 1: BEEP                                         'บบ
    GOSUB CheckEnd                                                    'บบ
REM Let the computer make a move                                      'บบ
    CALL FindMove(ScorePlayer, ScoreComputer)                         'บบ
    GOSUB CheckEnd                                                    'บบ
RETURN                                                                'บบ
CheckEnd:       'checks if the game has ended                         'บบ
    CALL DrawBoard(ScorePlayer, ScoreDraw, ScoreComputer)             'บบ
REM Check whether the player did win                                  'บบ
    IF CheckPlayerWin THEN                                            'บบ
        ScorePlayer = ScorePlayer + 1: BEEP                           'บบ
        CALL GameEnd("Win"): GOTO FieldInit                           'บบ
    END IF                                                            'บบ
REM Check whether the computer did win                                'บบ
    IF CheckComputerWin THEN                                          'บบ
        ScoreComputer = ScoreComputer + 1: BEEP                       'บบ
        CALL GameEnd("Lose"): GOTO FieldInit                          'บบ
    END IF                                                            'บบ
REM Check whether there is a draw                                     'บบ
    IF CheckGameDraw THEN                                             'บบ
        ScoreDraw = ScoreDraw + 1: BEEP                               'บบ
        CALL GameEnd("Draw"): GOTO FieldInit                          'บบ
    END IF                                                            'บบ
RETURN                                                                'บบ
'ศสออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออสผ

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
                    LOCATE I * 6 + 2, J * 6 + 2: PRINT "Û Û"
                    LOCATE I * 6 + 3, J * 6 + 2: PRINT " Û "
                    LOCATE I * 6 + 4, J * 6 + 2: PRINT "Û Û"
                CASE IS = 2
                    COLOR 4
                    LOCATE I * 6 + 2, J * 6 + 2: PRINT "Ü฿Ü"
                    LOCATE I * 6 + 3, J * 6 + 2: PRINT "Ý Þ "
                    LOCATE I * 6 + 4, J * 6 + 2: PRINT "฿Ü฿"
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
            PRINT "ษหออออออออออออออออออออออออออออออออออออหป"
            PRINT "บบ  Ý Þ Ü฿Ü Ý Þ Û฿Û                   บบ"
            PRINT "บบ  ฿Û฿ Ý Þ Ý Þ Û฿Ü                   บบ"
            PRINT "บบ   Û  ฿Ü฿ ÛÜÛ Û ÞÝ                  บบ"
            PRINT "บบ                                    บบ"
            PRINT "บบ       Ý   Þ  ÛÜ  Û ÛÜ  Û Û฿฿ Û฿Û   บบ"
            PRINT "บบ       Ý Û ÞÞÝÛ Û Û Û Û Û Û฿  Û฿Ü   บบ"
            PRINT "บบ       ÛÜÛÜÛÞÝÛ  ฿Û Û  ฿Û ÛÛÛ Û ÞÝ  บบ"
            PRINT "ศสออออออออออออออออออออออออออออออออออออสผ"
            SLEEP 1'0       '10       '20       '30       '40
        CASE "Lose"
            COLOR 4
            PRINT "ษหออออออออออออออออออออออออออออออออออออหป"
            PRINT "บบ  Ý Þ Ü฿Ü Ý Þ Û฿Û                   บบ"
            PRINT "บบ  ฿Û฿ Ý Þ Ý Þ Û฿Ü                   บบ"
            PRINT "บบ   Û  ฿Ü฿ ÛÜÛ Û ÞÝ                  บบ"
            PRINT "บบ                                    บบ"
            PRINT "บบ            Ü฿Ü   Ý   Ü฿Ü Ü฿฿฿ Û฿฿  บบ"
            PRINT "บบ            ÛÜÛ   Ý   Ý Þ ฿฿ÜÜ Û฿   บบ"
            PRINT "บบ            Ý Þ   ÛÜÜ ฿Ü฿ ÜÜÜ฿ ÛÛÛ  บบ"
            PRINT "ศสออออออออออออออออออออออออออออออออออออสผ"
            SLEEP 1'0       '10       '20       '30       '40
        CASE "Draw"
            COLOR 7
            PRINT "ษหออออออออออออออออออออออออออออออออออออหป"
            PRINT "บบ  Ü฿Ü   Ü฿฿฿ Ü฿Ü ฿฿Û฿฿              บบ"
            PRINT "บบ  ÛÜÛ   Û    ÛÜÛ   Û                บบ"
            PRINT "บบ  Ý Þ   ฿ÜÜÜ Ý Þ   Û                บบ"
            PRINT "บบ                                    บบ"
            PRINT "บบ                Ü฿฿฿ Ü฿Ü Û฿Û฿Û Û฿฿  บบ"
            PRINT "บบ                Û ÜÜ ÛÜÛ Ý Û Þ Û฿   บบ"
            PRINT "บบ                ฿ÜÜÛ Ý Þ Ý   Þ ÛÛÛ  บบ"
            PRINT "ศสออออออออออออออออออออออออออออออออออออสผ"
            SLEEP 1'0       '10       '20       '30       '40
        CASE "Quit"
            CLS : COLOR 7
            PRINT "ษหออออออออออออออออออออออออออออออออออออหป"
            PRINT "บบ    Û฿Û฿Û Ü฿Ü Û฿฿Ü Û฿฿  Û฿฿Ü Ý Þ    บบ"
            PRINT "บบ    Ý Û Þ ÛÜÛ Û  Û Û฿   ÛÛÛ  ฿Û฿    บบ"
            PRINT "บบ    Ý   Þ Ý Þ ÛÜÜ฿ ÛÛÛ  ÛÜÜ฿  Û     บบ"
            PRINT "บบ                                    บบ"
            PRINT "บบ Û Ü฿ Û Û Ý   Û฿฿  Ü฿฿฿Þ ÝÜ฿Ü Ý   Þ บบ"
            PRINT "บบ ÛÛ   ฿Û฿ Ý   Û฿   ฿฿ÜÜÞ฿ÝÛÜÛ Ý Û Þ บบ"
            PRINT "บบ Û ฿Ü  Û  ÛÜÜ ÛÛÛ  ÜÜÜ฿Þ ÝÝ Þ ÛÜÛÜÛ บบ"
            PRINT "ศสออออออออออออออออออออออออออออออออออออสผ"
                   '0       '10       '20       '30       '40
            PRINT "Press Space to continue"
            WHILE INKEY$ <> CHR$(32)
            WEND: END

    END SELECT
END SUB

SUB TitleScreen
    CLS : COLOR 7
    PRINT "ษหออออออออออออออออออออออออออออออออออออหป" '01
    PRINT "บบ                                    บบ" '02
    PRINT "บบ  ฿฿Û฿฿ Û Û฿฿฿฿                     บบ" '03
    PRINT "บบ    Û   Û Û                         บบ" '04
    PRINT "บบ    Û   Û ÛÜÜÜÜ                     บบ" '05
    PRINT "บบ                                    บบ" '06
    PRINT "บบ          ฿฿Û฿฿ Ü฿Ü Û฿฿฿฿           บบ" '07
    PRINT "บบ            Û   ÛÜÛ Û               บบ" '08
    PRINT "บบ            Û   Ý Þ ÛÜÜÜÜ           บบ" '09
    PRINT "บบ                                    บบ" '10
    PRINT "บบ                    ฿฿Û฿฿ Ü฿Ü Û฿฿   บบ" '11
    PRINT "บบ                      Û   Ý Þ Û฿    บบ" '12
    PRINT "บบ                      Û   ฿Ü฿ ÛÛÛ   บบ" '13
    PRINT "บบ                                    บบ" '14
    PRINT "บบ       press space to continue      บบ" '15
    PRINT "ศสออออออออออออออออออออออออออออออออออออสผ" '16
           '0       '10       '20       '30       '40
    COLOR 1
    LOCATE 3, 3: PRINT "  ฿฿Û฿฿ Û Û฿฿฿฿                     "
    LOCATE 4, 3: PRINT "    Û   Û Û                         "
    LOCATE 5, 3: PRINT "    Û   Û ÛÜÜÜÜ                     "
    COLOR 4
    LOCATE 11, 3: PRINT "                    ฿฿Û฿฿ Ü฿Ü Û฿฿   "
    LOCATE 12, 3: PRINT "                      Û   Ý Þ Û฿    "
    LOCATE 13, 3: PRINT "                      Û   ฿Ü฿ ÛÛÛ   "

    WHILE INKEY$ <> CHR$(32)
    WEND
END SUB


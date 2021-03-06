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
            PRINT "ษหอออออออออออออออออออออออออออออออออออออออออออออออหป"
            PRINT "บบ Û Û Ü฿Ü Ý Þ Û฿Û   Ý   Þ  ÛÜ  Û ÛÜ  Û Û฿฿ Û฿Û  บบ"
            PRINT "บบ ฿Û฿ Ý Þ Ý Þ Û฿Ü   Ý Û ÞÞÝÛ Û Û Û Û Û Û฿  Û฿Ü  บบ"
            PRINT "บบ  Û  ฿Ü฿ ÛÜÛ Û ÞÝ  ÛÜÛÜÛÞÝÛ  ฿Û Û  ฿Û ÛÛÛ Û ÞÝ บบ"
            PRINT "ศสอออออออออออออออออออออออออออออออออออออออออออออออสผ"
        CASE "Lose"
            COLOR 4
            PRINT "ษหอออออออออออออออออออออออออออออออออออออออออออออออหป"
            PRINT "บบ   Û Û Ü฿Ü Ý Þ Û฿Û    Ü฿Ü   Ý   Ü฿Ü Ü฿฿฿ Û฿฿   บบ"
            PRINT "บบ   ฿Û฿ Ý Þ Ý Þ Û฿Ü    ÛÜÛ   Ý   Ý Þ ฿฿ÜÜ Û฿    บบ"
            PRINT "บบ    Û  ฿Ü฿ ÛÜÛ Û ÞÝ   Ý Þ   ÛÜÜ ฿Ü฿ ÜÜÜ฿ ÛÛÛ   บบ"
            PRINT "ศสอออออออออออออออออออออออออออออออออออออออออออออออสผ"
        CASE "Quit"
            COLOR 7
            PRINT "ษหอออออออออออออออออออออออออออออออออออออออออออออออหป"
            PRINT "บบ         Û฿Û฿Û Ü฿Ü Û฿฿Ü Û฿฿   Û฿฿Ü Û Û         บบ"
            PRINT "บบ         Ý Û Þ ÛÜÛ Û  Û Û฿    ÛÛÛ  ฿Û฿         บบ"
            PRINT "บบ         Ý   Þ Ý Þ ÛÜÜ฿ ÛÛÛ   ÛÜÜ฿  Û          บบ"
            PRINT "บบ                                               บบ"
            PRINT "บบ     Û Ü฿ Û Û Ý   Û฿฿   Û฿฿฿ Ý Þ Ü฿Ü Ý   Þ     บบ"
            PRINT "บบ     ÛÛ   ฿Û฿ Ý   Û฿    ฿฿ÜÜ ÛÛÛ ÛÜÛ Ý Û Þ     บบ"
            PRINT "บบ     Û ฿Ü  Û  ÛÜÜ ÛÛÛ   ÜÜÜÛ Ý Þ Ý Þ ÛÜÛÜÛ     บบ"
            PRINT "ศสอออออออออออออออออออออออออออออออออออออออออออออออสผ"
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
    PRINT "ษหอออออออออออออออออออออออออออออออออออออออออออออออหป"  '01
    PRINT "บบ                                               บบ"  '02
    PRINT "บบ    Û฿฿฿ Ý Þ Û฿฿ Û฿฿฿ Û฿฿฿                     บบ"  '03
    PRINT "บบ    Û ÜÜ Ý Þ Û฿  ฿฿ÜÜ ฿฿ÜÜ                     บบ"  '04
    PRINT "บบ    ÛÜÜÛ ÛÜÛ ÛÛÛ ÜÜÜÛ ÜÜÜÛ                     บบ"  '05
    PRINT "บบ                                               บบ"  '06
    PRINT "บบ             ฿฿Û฿฿ Ý Þ Û฿฿                     บบ"  '07
    PRINT "บบ               Û   ÛÛÛ Û฿                      บบ"  '08
    PRINT "บบ               Û   Ý Þ ÛÛÛ                     บบ"  '09
    PRINT "บบ                                               บบ"  '10
    PRINT "บบ               ÛÜ  Û Ý Þ Û฿Û฿Û Û฿฿Ü Û฿฿ Û฿Û    บบ"  '11
    PRINT "บบ               Û Û Û Ý Þ Ý Û Þ ÛÛÛ  Û฿  Û฿Ü    บบ"  '12
    PRINT "บบ               Û  ฿Û ÛÜÛ Ý   Þ ÛÜÜ฿ ÛÛÛ Û Þ    บบ"  '13
    PRINT "บบ                                               บบ"  '14
    PRINT "บบ        Select a number between 1 and 9        บบ"  '15
    PRINT "ศสอออออออออออออออออออออออออออออออออออออออออออออออสผ"  '16

    COLOR 12
    LOCATE 3, 3:  PRINT "    Û฿฿฿ Ý Þ Û฿฿ Û฿฿฿ Û฿฿฿                     "
    LOCATE 4, 3:  PRINT "    Û ÜÜ Ý Þ Û฿  ฿฿ÜÜ ฿฿ÜÜ                     "
    LOCATE 5, 3:  PRINT "    ÛÜÜÛ ÛÜÛ ÛÛÛ ÜÜÜÛ ÜÜÜÛ                     "

    COLOR 10
    LOCATE 7, 3:  PRINT "             ฿฿Û฿฿ Ý Þ Û฿฿                     "
    LOCATE 8, 3:  PRINT "               Û   ÛÛÛ Û฿                      "
    LOCATE 9, 3:  PRINT "               Û   Ý Þ ÛÛÛ                     "

    COLOR 9
    LOCATE 11, 3: PRINT "               ÛÜ  Û Ý Þ Û฿Û฿Û Û฿฿Ü Û฿฿ Û฿Û    "
    LOCATE 12, 3: PRINT "               Û Û Û Ý Þ Ý Û Þ ÛÛÛ  Û฿  Û฿Ü    "
    LOCATE 13, 3: PRINT "               Û  ฿Û ÛÜÛ Ý   Þ ÛÜÜ฿ ÛÛÛ Û Þ    "

    WHILE K$ <> "9" AND INKEY$ <> "8" AND K$ <> "7" AND K$ <> "6" AND K$ <> "5" AND K$ <> "4" AND K$ <> "3" AND K$ <> "2" AND K$ <> "1"
        K$ = INKEY$
    WEND
    COLOR 7: LOCATE 17, 1
    RANDOMIZE TIMER / 3: PRINT "Was it"; INT(RND * 9) + 1; "?"
    PRINT "press space to continue"
    WHILE INKEY$ <> CHR$(32)
    WEND
END SUB


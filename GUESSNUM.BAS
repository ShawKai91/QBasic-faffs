REM made by Shaw Kai (c) 2020

DECLARE SUB MakeFile ()
DECLARE SUB TitleScreen ()
DECLARE SUB PlayAgain (Game AS STRING)
TYPE Menu: level AS STRING * 25: Discription AS STRING * 50: END TYPE
TYPE Difficulty: level AS LONG: Tries AS INTEGER: END TYPE

REM  declares the varibles used in the program
DIM cursery AS INTEGER, opt AS INTEGER, optmax AS INTEGER: optmax = 11
DIM Anwser AS LONG, Guess AS LONG, Last AS STRING * 10
DIM SHARED Difficulty(optmax) AS Difficulty, Menu(optmax) AS Menu

OPEN "\MenuData.dat" FOR BINARY AS #1
    IF LOF(1) = 0 THEN
        CLOSE #1
        CALL MakeFile
    END IF
CLOSE #1

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

SUB MakeFile
OPEN "MenuData.dat" FOR OUTPUT AS #1
    WRITE #1, "Easy", "between 1 and 10, 5 Tries", 10, 5
    WRITE #1, "Medium", "Between 1 and 50, 10 Tries", 50, 10
    WRITE #1, "Hard", "Between 1 and 100, 15 Tries", 100, 15
    WRITE #1, "Extreme", "Between 1 and 200, 20 Tries", 200, 20
    WRITE #1, "Brutal", "Between 1 and 500, 20 Tries", 500, 20
    WRITE #1, "Mega_Brutal", "Between 1 and 1000, 15 Tries", 1000, 15
    WRITE #1, "Near_Impossible", "Between 1 and 5000, 15 Tries", 5000, 15
    WRITE #1, "Insane", "Between 1 and 10000, 10 Tries", 10000, 10
    WRITE #1, "Absurd", "Between 1 and 50000, 10 Tries", 50000, 10
    WRITE #1, "Inconceivable", "Between 1 and 100000, 5 Tries", 100000, 5
    WRITE #1, "Impossible", "Between 1 and 1000000, 5 Tries", 1000000, 5
END SUB

SUB PlayAgain (Game AS STRING)
DIM Again AS STRING, test AS STRING
WHILE UCASE$(Again) <> "Y" AND UCASE$(Again) <> "YES"
    SELECT CASE Game
        CASE "Win"
            COLOR 2
            PRINT "彬様様様様様様様様様様様様様様様様様様様様様様様曜�"
            PRINT "査 � � 槹� � � 桎�   �   �  桀  � 桀  � 桎� 桎�  査"
            PRINT "査 炳� � � � � 桎�   � � 湎毟 � � � � � 桎  桎�  査"
            PRINT "査  �  炮� 桀� � 渺  桀桀栲毟  炳 �  炳 栩� � 渺 査"
            PRINT "畔様様様様様様様様様様様様様様様様様様様様様様様擁�"
        CASE "Lose"
            COLOR 4
            PRINT "彬様様様様様様様様様様様様様様様様様様様様様様様曜�"
            PRINT "査   � � 槹� � � 桎�    槹�   �   槹� 槹烝 桎�   査"
            PRINT "査   炳� � � � � 桎�    桀�   �   � � 烝樛 桎    査"
            PRINT "査    �  炮� 桀� � 渺   � �   桀� 炮� 樛槹 栩�   査"
            PRINT "畔様様様様様様様様様様様様様様様様様様様様様様様擁�"
        CASE "Quit"
            COLOR 7
            PRINT "彬様様様様様様様様様様様様様様様様様様様様様様様曜�"
            PRINT "査         桎桎� 槹� 桎炮 桎�   桎炮 � �         査"
            PRINT "査         � � � 桀� �  � 桎    栩�  炳�         査"
            PRINT "査         �   � � � 桀槹 栩�   桀槹  �          査"
            PRINT "査                                               査"
            PRINT "査     � 槹 � � �   桎�   桎烝 � � 槹� �   �     査"
            PRINT "査     栩   炳� �   桎    烝樛 栩� 桀� � � �     査"
            PRINT "査     � 炮  �  桀� 栩�   樛樂 � � � � 桀桀�     査"
            PRINT "畔様様様様様様様様様様様様様様様様様様様様様様様擁�"
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
    PRINT "彬様様様様様様様様様様様様様様様様様様様様様様様曜�"  '01
    PRINT "査                                               査"  '02
    PRINT "査    桎烝 � � 桎� 桎烝 桎烝                     査"  '03
    PRINT "査    � 樛 � � 桎  烝樛 烝樛                     査"  '04
    PRINT "査    桀樂 桀� 栩� 樛樂 樛樂                     査"  '05
    PRINT "査                                               査"  '06
    PRINT "査             烝桎� � � 桎�                     査"  '07
    PRINT "査               �   栩� 桎                      査"  '08
    PRINT "査               �   � � 栩�                     査"  '09
    PRINT "査                                               査"  '10
    PRINT "査               桀  � � � 桎桎� 桎炮 桎� 桎�    査"  '11
    PRINT "査               � � � � � � � � 栩�  桎  桎�    査"  '12
    PRINT "査               �  炳 桀� �   � 桀槹 栩� � �    査"  '13
    PRINT "査                                               査"  '14
    PRINT "査        Select a number between 1 and 9        査"  '15
    PRINT "畔様様様様様様様様様様様様様様様様様様様様様様様擁�"  '16

    COLOR 12
    LOCATE 3, 3:  PRINT "    桎烝 � � 桎� 桎烝 桎烝                     "
    LOCATE 4, 3:  PRINT "    � 樛 � � 桎  烝樛 烝樛                     "
    LOCATE 5, 3:  PRINT "    桀樂 桀� 栩� 樛樂 樛樂                     "

    COLOR 10
    LOCATE 7, 3:  PRINT "             烝桎� � � 桎�                     "
    LOCATE 8, 3:  PRINT "               �   栩� 桎                      "
    LOCATE 9, 3:  PRINT "               �   � � 栩�                     "

    COLOR 9
    LOCATE 11, 3: PRINT "               桀  � � � 桎桎� 桎炮 桎� 桎�    "
    LOCATE 12, 3: PRINT "               � � � � � � � � 栩�  桎  桎�    "
    LOCATE 13, 3: PRINT "               �  炳 桀� �   � 桀槹 栩� � �    "

    WHILE K$ <> "9" AND INKEY$ <> "8" AND K$ <> "7" AND K$ <> "6" AND K$ <> "5" AND K$ <> "4" AND K$ <> "3" AND K$ <> "2" AND K$ <> "1"
        K$ = INKEY$
    WEND
    COLOR 7: LOCATE 17, 1
    RANDOMIZE TIMER / 3: PRINT "Was it"; INT(RND * 9) + 1; "?"
    PRINT "press space to continue"
    WHILE INKEY$ <> CHR$(32)
    WEND
END SUB


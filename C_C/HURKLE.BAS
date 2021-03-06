DECLARE SUB whereTo (a!, b!, x!, y!)
CLS
PRINT TAB(33); "HURKLE"
PRINT TAB(15); "Creative Computing Horristown,New Jersy"
PRINT : PRINT : PRINT

N = 5: G = 10
PRINT
PRINT "A hurkle is hiding on a"; G; "by"; G; "grid. Homebase"
PRINT "on the grid is point 0,0 and any gridpoint is a"
PRINT "pair of whole numbers separated by a comma. Try to"
PRINT "guess the hurkle's gridpoint. You get"; N; "tries."
PRINT "After each try, I will tell you the approximate"
PRINT "direction to go to look for the hurkle."
PRINT

Main:
    a = INT(G * RND(1)): b = INT(G * RND(1))
    FOR K = 1 TO N
        PRINT "Guess #"; K;
        INPUT x, y   ' x  y 
        IF ABS(x - a) + ABS(y - b) = 0 THEN GOTO FoundHer
REM   print info
        CALL whereTo(a, b, x, y)
        PRINT
    NEXT K
    PRINT
    PRINT "Sorry, that's"; N; "Guesses."
    PRINT "The hurkle is at "; a; ","; b
    PRINT
PlayAgain:
    INPUT "play again? ", again
    IF again THEN
        PRINT "Let's play again. The hurkle is hiding."
        PRINT : GOTO Main
    ELSE
        CLS : PRINT "thanks for playing": END
    END IF

FoundHer:
    PRINT
    PRINT "You found Her in"; K; "guesses"
    GOTO PlayAgain

SUB whereTo (a, b, x, y)
    PRINT "Go ";
    IF y = b THEN GOTO TestA
    IF y > b THEN GOTO North
South:
    PRINT "South"; : GOTO TestA
North:
    PRINT "North";
TestA:
    IF x = a THEN GOTO EndHere
    IF x < a THEN GOTO East
West:
    PRINT "West"; : GOTO EndHere
East:
    PRINT "East";
EndHere:
    PRINT

END SUB


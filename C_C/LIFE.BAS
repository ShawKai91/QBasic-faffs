PRINT TAB(34); "LIFE"
PRINT TAB(15); "CREATIVE COMPUTING MORRISTOWN, NEW JERSY"
PRINT : PRINT : PRINT

PRINT "Enter your pattern:"
X1 = 1: Y1 = 1: X2 = 24: Y2 = 70
DIM A(24, 70), B$(24)
C = 1
L30:
    INPUT B$(C)
    IF B$(C) = "DONE" THEN B$(C) = "": GOTO L80
    IF LEFT$(B$(C), 1) = "." THEN B$(C) = " " + RIGHT$(B$(C), LEN(B$(C)) - 1)
    C = C + 1
    GOTO L30
L80:
    C = C - 1: L = 0
    FOR X = 1 TO C - 1
        IF LEN(B$(X)) > L THEN L = LEN(B$(X))
    NEXT X
    X1 = 11 - C / 2: Y1 = 33 - L / 2
    FOR X = 1 TO C
        FOR Y = 1 TO LEN(B$(X))
            IF MID$(B$(X), Y, 1) <> " " THEN A(X1 + X, Y1 + Y) = 1: P = P + 1
        NEXT Y
    NEXT X
    PRINT : PRINT : PRINT
L210:
    PRINT "Generation:"; G, "Population:"; P; : IF I9 THEN PRINT "INVALID"
    X3 = 24: Y3 = 70: X4 = 1: Y4 = 1: P = 0
    G = G + 1
    FOR X = 1 TO X1 - 1: PRINT : NEXT X
    FOR X = X1 TO X2
        PRINT
        FOR Y = Y1 TO Y2
            IF A(X, Y) = 2 THEN A(X, Y) = 0: GOTO L270
            IF A(X, Y) = 3 THEN A(X, Y) = 1: GOTO L261
            IF A(X, Y) <> 1 THEN GOTO L270
L261:
            PRINT TAB(Y); "*";
            IF X < X3 THEN X3 = X
            IF X > X4 THEN X4 = X
            IF Y < Y3 THEN Y3 = Y
            IF Y > Y4 THEN Y4 = Y
L270:
        NEXT Y
    NEXT X
    FOR X = X2 + 1 TO 24: PRINT : NEXT X
    X1 = X3: X2 = X4: Y1 = Y3: Y2 = Y4
    IF X1 < 3 THEN X1 = 3: I9 = -1
    IF X2 > 22 THEN X2 = 22: I9 = -1
    IF Y1 < 3 THEN Y1 = 3: I9 = -1
    IF Y2 < 68 THEN Y2 = 68: I9 = -1
    P = 0
    FOR X = X1 - 1 TO X2 + 1
        FOR Y = Y1 - 1 TO Y2 + 1
            C = 0
            FOR I = X - 1 TO X + 1
                FOR J = Y - 1 TO Y + 1
                    IF A(I, J) = 1 OR A(I, J) = 2 THEN C = C + 1
                NEXT J
            NEXT I
            IF A(X, Y) = 0 THEN GOTO L610
            IF C < 3 OR C > 4 THEN A(X, Y) = 2: GOTO L600
            P = P + 1
L600:
            GOTO L620
L610:
            IF C = 3 THEN A(X, Y) = 3: P = P + 1
L620:
        NEXT Y
    NEXT X
    X1 = X1 - 1: Y1 = Y1 - 1: X2 = X2 + 1: Y2 = Y2 + 1
    GOTO L210
END


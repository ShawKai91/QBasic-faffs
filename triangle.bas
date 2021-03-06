SCREEN 12
CLEAR :   H = 480 / 2: W = 640 / 2:   TriForce$ = "false"
TYPE vector
    x AS INTEGER
    y AS INTEGER
END TYPE
DIM TipsT(3) AS vector, TipsB(3) AS vector, c(3) AS INTEGER
c(0) = 4:  c(1) = 2:  c(2) = 1

TipsT(0).x = 0:          TipsT(0).y = H
TipsT(1).x = W:          TipsT(1).y = H
TipsT(2).x = W * .5:     TipsT(2).y = 0
TipsB(0).x = TipsT(0).x: TipsB(0).y = TipsT(0).y
TipsB(1).x = TipsT(1).x: TipsB(1).y = TipsT(1).y
TipsB(2).x = W * .5:     TipsB(2).y = H * 2

IF TriForce$ = "true" THEN
    LINE (0, H)-(W, H * 2), 14, BF
ELSEIF TriForce$ = "false" THEN
    LINE (0, H)-(W, 0), 7, BF
END IF

x(0) = TipsT(0).x: x(1) = TipsB(2).x: y(0) = TipsT(0).y: y(1) = TipsB(2).y
WHILE INKEY$ = ""
    RANDOMIZE TIMER: v(0) = INT(RND * 3)
    x(0) = (x(0) + TipsT(v(0)).x) * .5: y(0) = (y(0) + TipsT(v(0)).y) * .5
    IF TriForce$ = "false" THEN
        PSET (x(0), y(0)), c(v(0))
    ELSEIF TriForce$ = "true" THEN
        PSET (x(0), y(0)), 14
    END IF
    IF TriForce$ = "true" THEN
        RANDOMIZE TIMER: v(1) = INT(RND * 3)
        x(1) = (x(1) + TipsB(v(1)).x) * .5: y(1) = (y(1) + TipsB(v(1)).y) * .5
        PSET (x(1), y(1)), 0
    END IF
WEND


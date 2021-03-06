DECLARE SUB AI ()
DECLARE SUB UpdateBall ()
DECLARE SUB UpdatePaddle ()
DECLARE SUB SetBall ()
SCREEN 13

CONST pi = 3.1415927#
CONST HGT = 200 - 1: CONST Wid = 320 - 1: CONST SP = 8
CONST PadL = 32: CONST PadW = 2: CONST PSeg = PadL / 8

TYPE ball
    x AS INTEGER: Y AS INTEGER: R AS INTEGER
    XSp AS INTEGER: YSp AS INTEGER: Ang AS SINGLE
    C AS INTEGER
END TYPE

DIM SHARED P1Score AS INTEGER, P2Score AS INTEGER
DIM SHARED ball AS ball, Y1, Y2, Player2 AS STRING
    Y1 = (HGT / 2) - (PadL / 2): Y2 = Y1: Player2$ = "False"
    TIMER ON
    CALL SetBall
    WHILE INKEY$ <> "f"
        'CLS
        COLOR 4: LOCATE 1, 10: PRINT P1Score
        COLOR 1: LOCATE 1, 30: PRINT P2Score
        COLOR 7: GOSUB MainLoop
    WEND
    GOTO EndGame

MainLoop:
        CALL UpdatePaddle
        CALL UpdateBall
        CALL AI
RETURN

EndGame:

    SLEEP: END

SUB AI
    LET Debug$ = "False"
    IF Debug$ = "True" THEN
        LOCATE 5, 5: PRINT PadL, (8 * PSeg)
    END IF
REM AI is playing
    IF Player2$ = "False" THEN
        COLOR 10: LOCATE 2, 5: PRINT "The AI is Playing"
        IF ball.x > (Wid / 2) AND (RND * 2) < 1 THEN
            IF ball.Y > (Y2 + (4 * PSeg)) AND (Y2 + PadL) < (HGT - SP) THEN
                Y2 = Y2 + PSeg
            ELSEIF ball.Y < (Y2 + (4 * PSeg)) AND Y2 > SP THEN
                Y2 = Y2 - PSeg
            END IF
        END IF
    END IF
    COLOR 7

END SUB

SUB SetBall
    CLS
    RANDOMIZE TIMER / 3
    ball.x = Wid / 2: ball.Y = HGT / 2: ball.Ang = (pi / 180) * ((RND * 91) + 315)
    ball.XSp = 3 * COS(ball.Ang): ball.YSp = 3 * SIN(ball.Ang): ball.C = 7
    IF INT(RND * 2) < 1 THEN ball.XSp = -ball.XSp

END SUB

SUB UpdateBall
    LET score$ = "T" 'bounces of the walls instead of scoring
    LET ball.R = 2
    CIRCLE (ball.x, ball.Y), ball.R, ball.C
    ball.x = ball.x + ball.XSp: ball.Y = ball.Y + ball.YSp
    IF 0 > ball.Y - ball.R OR ball.Y + ball.R > HGT THEN ball.YSp = -ball.YSp
REM check if it hit paddle 1
    IF Y1 < ball.Y AND ball.Y < (Y1 + PadL) AND (ball.x + ball.R) > 32 THEN
        IF (ball.x - ball.R) < (32 + (PadW + 1)) THEN
            IF ball.Y < (Y1 + (1 * PSeg)) AND ball.Y > (Y1 + (0 * PSeg)) THEN
                ball.XSp = 3 * COS(315 * (pi / 180))
                ball.YSp = 3 * SIN(315 * (pi / 180))
            ELSEIF ball.Y < (Y1 + (2 * PSeg)) AND ball.Y > (Y1 + (1 * PSeg)) THEN
                ball.XSp = 3 * COS(330 * (pi / 180))
                ball.YSp = 3 * SIN(330 * (pi / 180))
            ELSEIF ball.Y < (Y1 + (3 * PSeg)) AND ball.Y > (Y1 + (2 * PSeg)) THEN
                ball.XSp = 3 * COS(345 * (pi / 180))
                ball.YSp = 3 * SIN(345 * (pi / 180))
            ELSEIF ball.Y < (Y1 + (4 * PSeg)) AND ball.Y > (Y1 + (3 * PSeg)) THEN
                ball.XSp = 3 * COS(0 * (pi / 180))
                ball.YSp = 3 * SIN(0 * (pi / 180))
            ELSEIF ball.Y < (Y1 + (5 * PSeg)) AND ball.Y > (Y1 + (4 * PSeg)) THEN
                ball.XSp = 3 * COS(0 * (pi / 180))
                ball.YSp = 3 * SIN(0 * (pi / 180))
            ELSEIF ball.Y < (Y1 + (6 * PSeg)) AND ball.Y > (Y1 + (5 * PSeg)) THEN
                ball.XSp = 3 * COS(15 * (pi / 180))
                ball.YSp = 3 * SIN(15 * (pi / 180))
            ELSEIF ball.Y < (Y1 + (7 * PSeg)) AND ball.Y > (Y1 + (6 * PSeg)) THEN
                ball.XSp = 3 * COS(30 * (pi / 180))
                ball.YSp = 3 * SIN(30 * (pi / 180))
            ELSEIF ball.Y < (Y1 + (8 * PSeg)) AND ball.Y > (Y1 + (7 * PSeg)) THEN
                ball.XSp = 3 * COS(45 * (pi / 180))
                ball.YSp = 3 * SIN(45 * (pi / 180))
            END IF
            BEEP: ball.C = 4
        END IF
    END IF
REM check it it hit paddle 2
    IF Y2 < ball.Y AND ball.Y < (Y2 + PadL) AND (ball.x - ball.R) < (Wid - 32) THEN
        IF (ball.x + ball.R) > (Wid - (32 + (PadW + 1))) THEN
            IF ball.Y < (Y2 + (1 * PSeg)) AND ball.Y > (Y2 + (0 * PSeg)) THEN
                ball.XSp = 3 * COS(225 * (pi / 180))
                ball.YSp = 3 * SIN(225 * (pi / 180))
            ELSEIF ball.Y < (Y2 + (2 * PSeg)) AND ball.Y > (Y2 + (1 * PSeg)) THEN
                ball.XSp = 3 * COS(210 * (pi / 180))
                ball.YSp = 3 * SIN(210 * (pi / 180))
            ELSEIF ball.Y < (Y2 + (3 * PSeg)) AND ball.Y > (Y2 + (2 * PSeg)) THEN
                ball.XSp = 3 * COS(195 * (pi / 180))
                ball.YSp = 3 * SIN(195 * (pi / 180))
            ELSEIF ball.Y < (Y2 + (4 * PSeg)) AND ball.Y > (Y2 + (3 * PSeg)) THEN
                ball.XSp = 3 * COS(180 * (pi / 180))
                ball.YSp = 3 * SIN(180 * (pi / 180))
            ELSEIF ball.Y < (Y2 + (5 * PSeg)) AND ball.Y > (Y2 + (4 * PSeg)) THEN
                ball.XSp = 3 * COS(180 * (pi / 180))
                ball.YSp = 3 * SIN(180 * (pi / 180))
            ELSEIF ball.Y < (Y2 + (6 * PSeg)) AND ball.Y > (Y2 + (5 * PSeg)) THEN
                ball.XSp = 3 * COS(165 * (pi / 180))
                ball.YSp = 3 * SIN(165 * (pi / 180))
            ELSEIF ball.Y < (Y2 + (7 * PSeg)) AND ball.Y > (Y2 + (6 * PSeg)) THEN
                ball.XSp = 3 * COS(150 * (pi / 180))
                ball.YSp = 3 * SIN(150 * (pi / 180))
            ELSEIF ball.Y < (Y2 + (8 * PSeg)) AND ball.Y > (Y2 + (7 * PSeg)) THEN
                ball.XSp = 3 * COS(135 * (pi / 180))
                ball.YSp = 3 * SIN(135 * (pi / 180))
            END IF
            BEEP: ball.C = 1
        END IF
    END IF
    IF score$ <> "F" THEN
        IF (ball.x - ball.R) > Wid AND ball.C = 4 THEN
            P1Score = P1Score + 1: CALL SetBall
        ELSEIF (ball.x + ball.R) < 0 AND ball.C = 1 THEN
            P2Score = P2Score + 1: CALL SetBall
        ELSEIF (ball.x - ball.R) > Wid OR (ball.x + ball.R) < 0 THEN
            CALL SetBall
        END IF
    ELSE
    IF 0 > ball.x - ball.R OR ball.x + ball.R > Wid THEN ball.XSp = -ball.XSp
    END IF

END SUB

SUB UpdatePaddle
    LET BTN$ = INKEY$:
REM paddle1
    LINE (32, Y1)-STEP(0, PadL), 4
    LINE (33, Y1)-STEP(PadW, PadL), , BF
    IF BTN$ = "p" AND Y1 > SP THEN Y1 = Y1 - PSeg
    IF BTN$ = "." AND (Y1 + PadL) < (HGT - SP) THEN Y1 = Y1 + PSeg
REM paddle2
    LINE (Wid - 32, Y2)-STEP(0, PadL), 1
    LINE (Wid - 33, Y2)-STEP(-PadW, PadL), , BF
    IF Player2$ = "True" THEN
      IF BTN$ = "q" AND Y2 > SP THEN Y2 = Y2 - PSeg
      IF BTN$ = "z" AND (Y2 + PadL) < (HGT - SP) THEN Y2 = Y2 + PSeg
    END IF

END SUB


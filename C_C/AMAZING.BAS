CLS
PRINT TAB(20); "AMAZING PROGRAM"
PRINT TAB(15); "CREATIVE COMPUTING MORRISTOWN, NEW JERSEY"
PRINT : PRINT : PRINT : PRINT
In:
    INPUT "What are your Width & Lengh"; H, V
    IF H <> 1 AND V <> 1 THEN GOTO Start
    PRINT "Meaningless Dimenons. Try again.": GOTO In

Start:
    DIM W(H, V), V(H, V)
    PRINT : PRINT : PRINT : PRINT

    Q = 0: Z = 0: X = INT(RND(1) * H + 1)
    FOR I = 1 TO H
        IF I = X THEN GOTO L173
        PRINT ".--"; : GOTO L180
L173:
        PRINT ".  ";
L180:
    NEXT I
    PRINT "."
    C = 1: W(X, 1) = C: C = C + 1
    R = X: S = 1: GOTO L260
L210:
    IF R <> H THEN GOTO L240
    IF S <> V THEN GOTO L230
    R = 1: S = 1: GOTO L250
L230:
    R = 1: S = S + 1: GOTO L250
L240:
    R = R + 1
L250:
    IF W(R, S) = 0 THEN GOTO L210
L260:
    IF R - 1 = 0 THEN GOTO L530
    IF W(R - 1, S) <> 0 THEN GOTO L530
    IF S - 1 = 0 THEN GOTO L390
    IF W(R, S - 1) <> 0 THEN GOTO L390
    IF R = H THEN GOTO L330
    IF W(R + 1, S) <> 0 THEN GOTO L330
    X = INT(RND(1) * 3 + 1)
    ON X GOTO L790, L820, L860
L330:
    IF S <> V THEN GOTO L340
    IF Z = 1 THEN GOTO L370
    Q = 1: GOTO L350
L340:
    IF W(R, S + 1) <> 0 THEN GOTO L370
L350:
    X = INT(RND(1) * 3 + 1)
    ON X GOTO L790, L820, L910
L370:
    X = INT(RND(1) * 2 + 1)
    ON X GOTO L790, L820
L390:
    IF R = H THEN GOTO L470
    IF W(R + 1, S) <> 0 THEN GOTO L470
    IF S <> V THEN GOTO L420
    IF Z = 1 THEN GOTO L450
    Q = 1: GOTO L430
L420:
    IF W(R, S + 1) <> 0 THEN GOTO L450
L430:
    X = INT(RND(1) * 3 + 1)
    ON X GOTO L790, L860, L910
L450:
    X = INT(RND(1) * 2 + 1)
    ON X GOTO L790, L860
L470:
    IF S <> V THEN GOTO L490
    IF Z = 1 THEN GOTO L520
    Q = 1: GOTO L500
L490:
    IF W(R, S + 1) <> 0 THEN GOTO L520
L500:
    X = INT(RND(1) * 2 + 1)
    ON X GOTO L790, L910
L520:
    GOTO L790
L530:
    IF S - 1 = 0 THEN GOTO L670
    IF W(R, S - 1) <> 0 THEN GOTO L670
    IF R = H THEN GOTO L610
    IF W(R + 1, S) <> 0 THEN GOTO L610
    IF S <> V THEN GOTO L560
    IF Z = 1 THEN GOTO L590
    Q = 1: GOTO L570
L560:
    IF W(R, S + 1) <> 0 THEN GOTO L590
L570:
    X = INT(RND(1) * 3 + 1)
    ON X GOTO L820, L860, L910
L590:
    X = INT(RND(1) * 2 + 1)
    ON X GOTO L820, L860
L610:
    IF S <> V THEN GOTO L630
    IF Z = 1 THEN GOTO L660
    Q = 1: GOTO L640
L630:
    IF W(R, S + 1) <> 0 THEN GOTO L660
L640:
    X = INT(RND(1) * 2 + 1)
    ON X GOTO L820, L910
L660:
    GOTO L820
L670:
    IF R = H THEN GOTO L740
    IF W(R + 1, S) <> 0 THEN GOTO L740
    IF S <> V THEN GOTO L700
    IF Z = 1 THEN GOTO L730
    Q = 1: GOTO L830
L700:
    IF W(R, S + 1) <> 0 THEN GOTO L730
    X = INT(RND(1) * 2 + 1)
    ON X GOTO L860, L910
L730:
    GOTO L860
L740:
    IF S <> V THEN GOTO L760
    IF Z = 1 THEN GOTO L780
    Q = 1: GOTO L770
L760:
    IF W(R, S + 1) <> 0 THEN GOTO L780
L770:
    GOTO L910
L780:
    GOTO L1000
L790:
    W(R - 1, S) = C
    C = C + 1: V(R - 1, S) = 2: R = R - 1
    IF C = H * V + 1 THEN GOTO L1010
    Q = 0: GOTO L260
L820:
    W(R, S - 1) = C
L830:
    C = C + 1
    V(R, S - 1) = 1: S = S - 1: IF C = H * V + 1 THEN GOTO L1010
    Q = 0: GOTO L260
L860:
    W(R + 1, S) = C
    C = C + 1: IF V(R, S) = 0 THEN GOTO L880
    V(R, S) = 3: GOTO L890
L880:
    V(R, S) = 2
L890:
    R = R + 1
    IF C = H * V + 1 THEN GOTO L1010
    GOTO L530
L910:
    IF Q = 1 THEN GOTO L960
    W(R, S + 1) = C: C = C + 1: IF V(R, S) = 0 THEN GOTO L940
    V(R, S) = 3: GOTO L950
L940:
    V(R, S) = 1
L950:
    S = S + 1: IF C = H * V + 1 THEN GOTO L1010
    GOTO L260
L960:
    Z = 1
    IF V(R, S) = 0 THEN GOTO L980
    V(R, S) = 3: Q = 0: GOTO L1000
L980:
    V(R, S) = 1: Q = 0: R = 1: S = 1: GOTO L250
L1000:
    GOTO L210
L1010:
    FOR J = 1 TO V
        PRINT "I";
        FOR I = 1 TO H
            IF V(I, J) < 2 THEN GOTO L1030
            PRINT "   ";
            GOTO L1040
L1030:
            PRINT "  I";
L1040:
        NEXT I
        PRINT
        FOR I = 1 TO H
            IF V(I, J) = 0 THEN GOTO L1060
            IF V(I, J) = 2 THEN GOTO L1060
            PRINT ":  ";
            GOTO L1070
L1060:
            PRINT ":--";
L1070:
        NEXT I
        PRINT "."
    NEXT J
    END


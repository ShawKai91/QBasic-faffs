CLS
PRINT TAB(33); "NIM"
PRINT TAB(15); "Creative comuting Moriston, New Jersy"
PRINT : PRINT : PRINT
DIM A(100), B(100, 10), D(2)
PRINT "This is the game of Nim."
PRINT "Do you want instructions";

L240:
   INPUT Z$
   IF UCASE$(Z$) = "NO" THEN GOTO L440
   IF UCASE$(Z$) = "YES" THEN GOTO L310
   PRINT "Please Yes or No";
   GOTO L240
L310:
   PRINT "The game is played with a number of objects."
   PRINT "Any number of objects are removed from one pile by you and"
   PRINT "the machine alternately.  On your turn, you may take"
   PRINT "all the objects that remainin in any pile but you must"
   PRINT "take at lest one object, and you may take objects from"
   PRINT "only one pile on a turn.  You must specify wether"
   PRINT "winning is defind as taking or not taking the last object,"
   PRINT "The number of piles in the game, and how objects are"
   PRINT "originaly in each pile.  Each pile may contain a"
   PRINT "different number of objects."
   PRINT "The machine will show its move by listing each pile amd the"
   PRINT "number of objects remaning in the piles after each of its"
   PRINT "moves"
L440:
   PRINT
L450:
   INPUT "Enter win option -1 to take last, 2 to avoid last: ", W
   IF W = 1 THEN GOTO L490
   IF W <> 2 THEN GOTO L450
L490:
   INPUT "Enter number of piles: ", N
   IF N > 100 THEN GOTO L490
   IF N < 1 THEN GOTO L490
   IF N <> INT(N) THEN GOTO L490
   PRINT "Enter pile sizes"
   FOR I = 1 TO N
L560:
      PRINT I;
      INPUT A(I)
      IF A(I) > 2000 THEN GOTO L560
      IF A(I) < 1 THEN GOTO L560
      IF A(I) <> INT(A(I)) THEN GOTO L560
   NEXT I
   PRINT "Do you want to move first";
L630:
   INPUT Q9$
   IF UCASE$(Q9$) = "YES" THEN GOTO L1450
   IF UCASE$(Q9$) = "NO" THEN GOTO L700
   PRINT "please yes or no"
   GOTO L630
L700:
   IF W = 1 THEN GOTO L940
   LET C = 0
   FOR I = 0 TO N
      IF A(I) = 0 THEN GOTO L770
      LET C = C + 1
      IF C = 3 THEN GOTO L840
      LET D(C) = I
L770:
   NEXT I
   IF C = 2 THEN GOTO L920
   IF A(D(1)) > 1 THEN GOTO L820
L800:
   PRINT "Machine loses": GOTO L1640
L820:
   PRINT "Machine wins": GOTO L1640
L840:
   LET C = 0
   FOR I = 1 TO N
      IF A(I) > 1 THEN GOTO L940
      IF A(I) = 0 THEN GOTO L890
      LET C = C + 1
L890:
   NEXT I
   IF C / 2 <> INT(C / 2) THEN GOTO L820
   GOTO L940
L920:
   IF A(D(1)) = 1 THEN GOTO L820
   IF A(D(2)) = 1 THEN GOTO L820
L940:
   FOR I = 1 TO N
      LET E = A(I)
      FOR J = 0 TO 10
         LET F = E / 2: LET B(I, J) = 2 * (F - INT(F)): LET E = INT(F)
      NEXT J
   NEXT I
   FOR J = 10 TO 0 STEP -1
      LET C = 0: LET H = 0
      FOR I = 1 TO N
         IF B(I, J) = 0 THEN GOTO L1110
         LET C = C + 1
         IF A(I) <= H THEN GOTO L1110
         LET H = A(I): LET G = I
L1110:
      NEXT I
      IF C / 2 <> INT(C / 2) THEN GOTO L1190
   NEXT J
L1140:
   LET E = INT(N * RND(1) + 1)
   IF A(E) = 0 THEN GOTO L1140
   LET F = INT(A(E) * RND(1) + 1)
   GOTO L1380
L1190:
   LET A(G) = 0
   FOR J = 0 TO 10
      LET B(G, J) = 0: LET C = 0
      FOR I = 1 TO N
         IF B(I, J) = 0 THEN GOTO L1260
         LET C = C + 1
L1260:
      NEXT I
      LET A(G) = A(G) + 2 * (C / 2 - INT(C / 2)) * 2 ^ J
   NEXT J
   IF W = 1 THEN GOTO L1380
   LET C = 0
   FOR I = 1 TO N
      IF A(I) > 1 THEN GOTO L1380
      IF A(I) = 0 THEN GOTO L1350
      LET C = C + 1
L1350:
   NEXT I
   IF C / 2 <> INT(C / 2) THEN GOTO L1380
   LET A(G) = 1 - A(G)
L1380:
   PRINT "Pile  size"
   FOR I = 1 TO N
      PRINT I; A(I)
   NEXT I
   IF W = 2 THEN GOTO L1450
   GOSUB L1570
   IF Z = 1 THEN GOTO L820
L1450:
   INPUT "your move - Pile,Number to be removed: ", X, Y
   IF X > N THEN GOTO L1450
   IF X < 1 THEN GOTO L1450
   IF X <> INT(X) THEN GOTO L1450
   IF Y > A(X) THEN GOTO L1450
   IF Y < 1 THEN GOTO L1450
   IF Y <> INT(Y) THEN GOTO L1450
   LET A(X) = A(X) - Y
   GOSUB L1570
   IF Z = 1 THEN GOTO L800
   GOTO L700
L1570:
   LET Z = 0
   FOR I = 1 TO N
      IF A(I) = 0 THEN GOTO L1610
      RETURN
L1610:
   NEXT I
   LET Z = 1
   RETURN
L1640:
   INPUT "Do you want to play another game? ", Q9$
   IF UCASE$(Q9$) = "YES" THEN GOTO L1720
   IF UCASE$(Q9$) = "NO" THEN GOTO L1730
   PRINT "please yes or no"
   GOTO L1640
L1720:
   GOTO L440
L1730:
   END


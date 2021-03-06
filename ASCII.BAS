CONST pi = 3.141572
RANDOMIZE TIMER / 3
CLS

FOR i = 0 TO 255
'    PRINT i; CHR$(i),

A = (pi / 180) * ((RND * 91) + 315)
B = INT((A * 57.2958) - 360)
IF ABS(B) = 45 THEN COLOR 4 ELSE COLOR 7
PRINT B;

NEXT


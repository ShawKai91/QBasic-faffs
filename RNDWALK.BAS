SCREEN 12
DIM HGT AS INTEGER, WID AS INTEGER, STP AS INTEGER, Dir AS INTEGER
DIM x AS INTEGER, xp AS INTEGER, y AS INTEGER, yp AS INTEGER
HGT = 480: WID = 640: x = WID / 2: y = HGT / 2
CLS
    WHILE INKEY$ <> CHR$(27)
        RANDOMIZE TIMER
        IF RND * 1000 < 1 THEN STP = INT(RND * 75) + 25 ELSE STP = 2
        Dir = INT(RND * 8): GOSUB WalkCheck
        'LINE (xp, yp)-(x, y), 1
        PSET (x, y), 4
    WEND
SLEEP: END
WalkCheck:
    xp = x: yp = y
    IF Dir = 0 THEN y = y - STP
    IF Dir = 1 THEN x = x - STP
    IF Dir = 2 THEN y = y + STP
    IF Dir = 3 THEN x = x + STP
    IF Dir = 4 THEN y = y - STP: x = x - STP
    IF Dir = 5 THEN y = y - STP: x = x + STP
    IF Dir = 6 THEN y = y + STP: x = x - STP
    IF Dir = 7 THEN y = y + STP: x = x + STP
    IF x > 0 AND x < WID THEN x = x ELSE x = xp
    IF y > 0 AND y < HGT THEN y = y ELSE y = yp
RETURN


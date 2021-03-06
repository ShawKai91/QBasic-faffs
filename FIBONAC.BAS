SCREEN 12
x = 0: y = 1
CLS
FOR i = 0 TO 15
    LINE (0, 0)-(x, y), i, B
    t = y: y = x + y: x = t
NEXT


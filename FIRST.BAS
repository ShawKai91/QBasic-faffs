PRINT CHR$(72) + CHR$(101) + CHR$(108) + CHR$(108) + CHR$(111) + CHR$(32) + CHR$(87) + CHR$(111) + CHR$(114) + CHR$(108) + CHR$(100)
LET c$ = ""
IF c$ <> "F" THEN
 
 DEFINT A-Z
 DIM BG(300), Box(300), SC(127) ' BG holds background images. Box holds the Box image.
 SCREEN 13 ' graphic coordinate minimums are 0 to 319 column or 199 row maximums.
            ' set up screen background
  COLOR 4: LOCATE 10, 5: PRINT "Multikey Keyboard input routine"
  COLOR 10: LOCATE 12, 4: PRINT "Use the arrow keys to move the box."
  LOCATE 13, 4: PRINT "Note that you can press two or more"
  LOCATE 14, 4: PRINT "keys at once for diagonal movement!"
  COLOR 14: LOCATE 16, 4: PRINT " Also demonstrates how GET and PUT "
  LOCATE 17, 4: PRINT "are used to preserve the background."
  COLOR 11: LOCATE 20, 11: PRINT "Press [Esc] to quit"
  x = 150: y = 50: PX = x: PY = y ' actual box starting position

 GET (x, y)-(x + 15, y + 15), BG  ' GET original BG at start box position
 LINE (x, y)-(x + 15, y + 15), 9, BF ' the plain blue box to move
 GET (x, y)-(x + 15, y + 15), Box   ' GET to Box Array
 
 DO  'main loop
  t! = TIMER + .05
  DO         ' 1 Tick (1/18th second) keypress scancode read loop
   REM a$ = INKEY$ ' So the keyboard buffer won't get full
    code% = INP(&H60) ' Get keyboard scan code from port 96
    IF code% < 128 THEN SC(code%) = 1 ELSE SC(code% - 128) = 0 'true/false values to array
  LOOP UNTIL TIMER > t! ' loop until one tick has passed

  PX = x: PY = y  ' previous coordinates
  IF SC(75) = 1 THEN x = x - 5: IF x < 0 THEN x = 0
  IF SC(77) = 1 THEN x = x + 5: IF x > 304 THEN x = 304
  IF SC(72) = 1 THEN y = y - 5: IF y < 0 THEN y = 0
  IF SC(80) = 1 THEN y = y + 5: IF y > 184 THEN y = 184
  IF x <> PX OR y <> PY THEN             ' look for a changed coordinate value
    WAIT 936, 8: PUT (PX, PY), BG, PSET ' replace previous BG first
    GET (x, y)-(x + 15, y + 15), BG      ' GET BG at new position before box is set
    PUT (x, y), Box, PSET               ' PUT box image at new position
  END IF
LOOP UNTIL SC(1) = 1 ' main loop until [Esc] key (scan code 1) is pressed 
END IF
END

 


'∞∞∞±±±±≤≤≤≤€€€€ƒ PICTURE.BAS; Das QBasic Screenshot-Programm ƒ€€€€≤≤≤≤±±±±∞∞∞
'∞Copyright    (c)1995 MKC     Computing     und     MTI     MicroTronix Inc.∞
'∞∞∞±±±±≤≤≤≤€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€≤≤≤≤±±±±∞∞∞
'
'
'
'
'
'                  Sie dÅrfen dieses Programm frei kopieren
'
'
'
'                       Viel Spa· beim Experimentieren
'
'                                         '
'
DECLARE SUB ViewPicture (Datei$, XPos%, YPos%)
DECLARE SUB SavePicture (Datei$, PicBeginX%, PicBeginY%, PicEndX%, PicEndY%)

SCREEN 12

PRINT "Hallo!"
COLOR 5
PRINT "dies ist ein"
COLOR 9
PRINT "kleines Demo fÅr"
COLOR 14
PRINT "das PICTURE-Programm"

SavePicture "PICTURES\SAMPLE.PIC", 0, 0, 160, 65
CLS
ViewPicture "PICTURES\SAMPLE.PIC", 160, 65


'So, und DAS kînnen Sie mit dem geladenen Bild dann z.B. machen:

x1! = 160
x2! = 320
y1! = 65
y2! = 130

Groesse% = 4 + INT(((PMAP(x2!, 0) - PMAP(x1!, 0) + 1) * (1) + 7) / 8) * 4 * (PMAP(y2!, 1) - PMAP(y1!, 1) + 1)

DIM Box%(Groesse%)

GET (x1!, y1!)-(x2!, y2!), Box%
CLS

x% = 1
y% = 1

FOR i = 1 TO 30
 PUT (x%, y%), Box%, OR
  x% = x% + 8
  y% = y% + 1
 PUT (x% - 8, y% - 1), Box%, XOR
NEXT i

PUT (x%, y%), Box%

'Na, alles klar? Funktioniert recht simpel, was? Nun, jedenfalls viel Spa·
'damit. MTI '95

SUB SavePicture (Datei$, PicBeginX%, PicBeginY%, PicEndX%, PicEndY%)
CLOSE #1

OPEN Datei$ FOR RANDOM AS #1 LEN = 16
FIELD #1, 8 AS c$, 8 AS c2$


ID$ = "MKC-PIC"
VID$ = "Ver. 1.0"
LSET c$ = ID$
LSET c2$ = VID$
PUT #1, 1


LSET c$ = MKI$(PicBeginX%)
PUT #1, 2
LSET c$ = MKI$(PicEndX%)
PUT #1, 3
LSET c$ = MKI$(PicBeginY%)
PUT #1, 4
LSET c$ = MKI$(PicEndY%)
PUT #1, 5

x% = PicBeginX%
y% = PicBeginY%
Dat% = 6

FOR i = 1 TO (PicEndY% - PicBeginY%)
 FOR j = 1 TO ((PicEndX% - PicBeginX%) / 2)

 col% = POINT(x%, y%)
 PSET (x%, y%), col% - 1

 LSET c$ = MKD$(col%)
 PUT #1, Dat%
 
 x% = x% + 1
 IF x% = PicEndX% THEN EXIT FOR

 col% = POINT(x%, y%)
 PSET (x%, y%), col% - 1

 LSET c2$ = MKD$(col%)
 PUT #1, Dat%

 Dat% = Dat% + 1
 x% = x% + 1

 NEXT j

y% = y% + 1
x% = PicBeginX%
NEXT i

SOUND 3000, 1
END SUB

SUB ViewPicture (Datei$, XPos%, YPos%)
CLOSE #1

 OPEN Datei$ FOR RANDOM AS #1 LEN = 16
 FIELD #1, 8 AS c$, 8 AS c2$

GET #1, 2
PicBeginX% = CVI(c$)
GET #1, 3
PicEndX% = CVI(c$)
PicEndX% = PicEndX% + XPos%
GET #1, 4
PicBeginY% = CVI(c$)
GET #1, 5
PicEndY% = CVI(c$)
PicEndY% = PicEndY% + YPos%

Dat% = 6
x% = XPos%
y% = YPos%

FOR i = 1 TO (PicEndY% - YPos% - PicBeginY%)
 FOR j = 1 TO (((PicEndX% - XPos%) - PicBeginX%) / 2)

 GET #1, Dat%
 d# = CVD(c$)
 PSET (x%, y%), d#

 x% = x% + 1
 IF x% = PicEndX% - PicBeginX% THEN EXIT FOR

 GET #1, Dat%
 d# = CVD(c2$)
 PSET (x%, y%), d#

 Dat% = Dat% + 1
 x% = x% + 1

 NEXT j

y% = y% + 1
x% = XPos%
NEXT i


END SUB
DECLARE SUB ViewPictureV1 (Datei$, XPos%, YPos%)


Start:

SCREEN 12
WIDTH 80, 60
CLS

LOCATE 2, 1
SHELL "CD"

COLOR 2
LOCATE 1, 1
PRINT "Geben Sie den Namen des Bildes ein:"
LOCATE 1, 37
COLOR 10
INPUT "", Name$

COLOR 2
PRINT "Bild anzeigen (j/n) ?                                   "
LOCATE 2, 23
COLOR 10
INPUT "", view$

CLOSE
OPEN Name$ FOR RANDOM AS #1 LEN = 16
FIELD #1, 8 AS c$, 8 AS c2$

GET #1, 1

IF NOT c$ = "MKC-PIC " THEN
 COLOR 4
 PRINT "Die angegebene Datei ist keine MKC-PIC Datei!"
 COLOR 4
 PRINT "Wenn Sie die Datei wieder lîschen wollen, geben Sie 'Ja' ein. "
 COLOR 12
 LOCATE 4, 64
 INPUT "", ljn$
 IF ljn$ = "Ja" THEN CLOSE : KILL Name$: GOTO Again ELSE GOTO Again
END IF


IF LEFT$(c2$, 6) = "Ver. 1" THEN GOTO V1
'Hier ist Platz fÅr weitere Versionsabfragen

 COLOR 12
 PRINT "Die angegebene Datei hat eine falsche Version und kann nicht angezeigt werden!"
 COLOR 4
 GOTO Again

V1: '---------- ANZEIGE FöR BILDER DER VERSION 1.X ----------


GET #1, 2
PicBeginX% = CVI(c$)
GET #1, 3
PicEndX% = CVI(c$)
GET #1, 4
PicBeginY% = CVI(c$)
GET #1, 5
PicEndY% = CVI(c$)

COLOR 2
PRINT
PRINT "LÑnge: "; PicEndX% - PicBeginX%
PRINT "Hîhe: "; PicEndY% - PicBeginY%
PRINT

IF view$ = "j" THEN
 LINE (0, 80)-(PicEndX% - PicBeginX% + 1, PicEndY% + 81 - PicBeginY%), 15, BF
 ViewPictureV1 Name$, 1, 81
END IF
'---------- ENDE FöR VERSION 1.X ----------

SLEEP

Again:
CLS
AgainS:
COLOR 2
LOCATE 1, 1
PRINT "Weiteres Bild abrufen (j/n)?                                    "
LOCATE 1, 30
COLOR 10
INPUT "", Again$

IF Again$ = "j" THEN GOTO Start
IF Again$ = "n" THEN SCREEN 0: CLS : PRINT "Schînen DOS noch...": SYSTEM
GOTO AgainS

SUB ViewPictureV1 (Datei$, XPos%, YPos%)
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
 FOR J = 1 TO (((PicEndX% - XPos%) - PicBeginX%) / 2)

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

 NEXT J

y% = y% + 1
x% = XPos%
NEXT i

END SUB


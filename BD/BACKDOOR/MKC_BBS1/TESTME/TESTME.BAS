'Test Me Version 1.0dQ
'
'
'
'
'>>>>>>>>>>>>>>> DRCKEN SIE `F5' UM DAS PROGRAMM ZU STARTEN... <<<<<<<<<<<<<<
'-----------------------------------------------------------------------------
'
'
'
'
'
'
'
'
'
'
'
'
'
'*************
Deklarationen:
'-------------
'  *SUBS and FUNCTIONS
DECLARE SUB Figure ()
DECLARE SUB Richtig ()
DECLARE SUB Falsch ()
DECLARE SUB ClrS (title$, untitle$, ununtitle$)
DECLARE SUB Begruessung ()
DECLARE SUB Center (row%, text$)
DECLARE SUB CenterIn (row2%, text2$)
DECLARE SUB MKCIntro ()
DECLARE SUB Initialize ()
DECLARE SUB SetUp ()
DECLARE SUB TxtWin (X%, y%, p1$, p2$, fgc%, bgc%, fc%)
DECLARE SUB KeyIn (k1$, k2$, k3$, k4$, k5$, k6$)
DECLARE FUNCTION GetString$ (row%, col%, start$, end$, Vis%, Max%)
DECLARE FUNCTION Trim$ (X$)

'  *VARIABLEN
COMMON SHARED Pdra AS INTEGER
COMMON SHARED pkts AS INTEGER
COMMON SHARED kir AS INTEGER
COMMON SHARED cir AS INTEGER
COMMON SHARED Datei AS STRING
COMMON SHARED Antwort AS STRING

'**************
Initialisieren:
'--------------
ON ERROR GOTO Fehler

ON KEY(1) GOSUB Hilfe
KEY(1) ON
ON KEY(10) GOSUB EndOfProg
KEY(10) ON
ON KEY(5) GOSUB Menu1
KEY(5) ON

RANDOMIZE TIMER

Datei$ = ""

'*******
StartUp:
'-------

CLS
MKCIntro
SCREEN 0
SLEEP 1

ClrS "M K C - Manuel Kiessling Computing 1994 - prsentiert:", "TESTme Lernprogramm QBasic, deutsche Erstversion (V1.0d)", "F1 fr Hilfe, F10 zum Beenden, F5 fhrt immer zum Hauptmenu"
Begruessung



'*****
Menu1:
'-----
SCREEN 0

KEY(1) ON: KEY(5) ON: KEY(10) ON

ClrS "TESTme Hauptmenu", "Whlen Sie einen Menupunkt", "F1 fr Hilfe, F10 zum Beenden"

  TxtWin 18, 5, "Û", "Û", 15, 0, 4

     COLOR 11, 4
    Center 7, "1> Abfragedatei laden"
   
      COLOR 1, 4
     IF Datei$ = "" THEN
       Center 8, "Keine Abfragedatei geladen!"
     END IF
     Center 8, UCASE$(Datei$)

    
     COLOR 11, 4
    Center 10, "2> Abfrage starten"
    Center 12, "3> Fragen an Datei anfgen"
    Center 14, "4> Alle Fragen der Datei auflisten"
    Center 16, "5> Betriebssystem"
   

wf:
      COLOR 14, 4
     Center 18, "Geben Sie einen Menupunkt ein:"

     funk$ = GetString(18, 57, "", "", 1, 1)
    
    IF funk$ = "1" THEN GOSUB DateiOeffnen ELSE IF funk$ = "2" THEN GOSUB Abfrage ELSE IF funk$ = "3" THEN GOSUB Anfuegen ELSE IF funk$ = "4" THEN GOSUB ListeFragen ELSE IF funk$ = "5" THEN GOSUB LoadShell ELSE GOTO wf
GOTO Menu1



'************
DateiOeffnen:
'------------

ClrS "Abfragedatei in den Speicher laden", "Geben Sie Pfad und Namen der gewnschten Datei ein", "F1 fr Hilfe, F10 zum beenden, F5 fhrt zum Hauptmenu"
       
        IF Datei$ <> "" THEN Datei$ = "": CLOSE #1
        TxtWin 5, 10, "Û", "Û", 15, 0, 4

        
        LOCATE 11, 7
        COLOR 14, 4
         PRINT "                                     "
         LOCATE 11, 7
         SHELL "CD"

         LOCATE 12, 7
         COLOR 1, 4
        PRINT ; "Geben Sie eine .dat Datei ein:"
        COLOR 14, 4
         LOCATE 13, 6
         COLOR 30, 0
        PRINT "->                                                                    "
       
         COLOR 11, 0
         Datei$ = GetString$(13, 9, "SAMPLE.DAT", "", 67, 67)
         IF Datei$ = "" THEN RETURN

        OPEN Datei$ FOR RANDOM AS #1 LEN = 192
        FIELD #1, 71 AS Frage$, 1 AS Antwort$, 30 AS aa$, 30 AS ab$, 30 AS ac$, 30 AS ad$

RETURN





'********
Anfuegen:
'--------

IF Datei$ = "" THEN RETURN
ClrS "Fragen an ge”ffnete Datei anfgen", "Geben Sie die Angaben ein", "F1 fr Hilfe, F10 zum Beenden, F5 fhrt zum Hauptmenu"


start1:


TxtWin 3, 4, "Û", "Û", 15, 0, 4

       
X% = 1
schleife1:
 GET #1, X%
 IF EOF(1) THEN GOTO begin1:
 X% = X% + 1
GOTO schleife1

begin1:
       
        TxtWin 13, 10, "Û", "Û", 15, 0, 3
          COLOR 11, 3
         Center 11, "Whlen Sie eine Frage aus, die Sie bearbeiten wollen"
         
          COLOR 9, 3
         LOCATE 12, 15
         PRINT "(Es sind"; X% - 1; "Fragen vorhanden)"
         
          COLOR 30, 0
         LOCATE 14, 14
         PRINT "->                                                    "
         
          COLOR 11, 0
         LOCATE 14, 18
         INPUT "", X%
         IF X% <= 0 THEN X% = 1

TxtWin 3, 4, "Û", "Û", 15, 0, 4
       
        COLOR 11, 0
       LOCATE 4, 40
       PRINT X%
       
       
        COLOR 14, 4
       Center 6, "Wie soll die Frage lauten (71 Zeichen) ?"
        COLOR 0, 0
       LOCATE 7, 5
       PRINT STRING$(71, "Û")
       COLOR 11, 0: FrageX$ = GetString$(7, 5, "", "", 71, 71)
       
        COLOR 14, 4
       Center 8, "Wie soll die 1.Antwort lauten (30 Zeichen) ?"
        COLOR 0, 0
       LOCATE 9, 5
       PRINT STRING$(30, "Û")
       COLOR 11, 0: aax$ = GetString$(9, 5, "", "", 30, 30)
       
        COLOR 14, 4
       Center 10, "Wie soll die 2.Antwort lauten (30 Zeichen) ?"
        COLOR 0, 0
       LOCATE 11, 5
       PRINT STRING$(30, "Û")
       COLOR 11, 0: abx$ = GetString$(11, 5, "", "", 30, 30)
       
        COLOR 14, 4
       Center 12, "Wie soll die 3.Antwort lauten (30 Zeichen) ?"
        COLOR 0, 0
       LOCATE 13, 5
       PRINT STRING$(30, "Û")
       COLOR 11, 0: acx$ = GetString$(13, 5, "", "", 30, 30)
       
        COLOR 14, 4
       Center 14, "Wie soll die 4.Antwort lauten (30 Zeichen) ?"
        COLOR 0, 0
       LOCATE 15, 5
       PRINT STRING$(30, "Û")
       COLOR 11, 0: adx$ = GetString$(15, 5, "", "", 30, 30)
       
        COLOR 14, 4
       Center 16, "Wie soll die richtige Antwort lauten (a,b,c oder d) ?"
        COLOR 0, 0
       LOCATE 17, 5
       PRINT STRING$(1, "Û")
       COLOR 11, 0: antwortx$ = GetString$(17, 5, "", "", 1, 1)

        LSET Frage$ = FrageX$
        LSET aa$ = aax$
        LSET ab$ = abx$
        LSET ac$ = acx$
        LSET ad$ = adx$
        LSET Antwort$ = antwortx$

       PUT #1, X%

       COLOR 11, 4
       LOCATE 19, 5
       PRINT "Eine weitere Eingabe machen (j/n)?"
       again$ = GetString$(19, 40, "J", "", 1, 1)
       IF again$ = "J" THEN GOTO start1

RETURN


'*******
Abfrage:
'-------

IF Datei$ = "" THEN RETURN
ClrS "Abfrage aus ge”ffneter Datei", "Beantworten Sie die Fragen", "F1 fr Hilfe, F10 zum Beenden, 'Q' -> Hauptmenu, 'R' setzt Zhler zurck"

X% = 1
schleife2:
 GET #1, X%
 IF EOF(1) THEN GOTO start2:
 X% = X% + 1
GOTO schleife2


start2:

TxtWin 3, 4, "Û", "Û", 15, 0, 4


       DO
        quest% = RND * (X% - 1)
       LOOP UNTIL quest% <> 0
       
         COLOR 11, 0
         LOCATE 4, 40
         PRINT quest%
      
      IF bgf% = 0 THEN LOCATE 20, 5: COLOR 4, 4: PRINT STRING$(70, "Û")

      IF NOT bgf% = 0 THEN
          COLOR 11, 4
         LOCATE 20, 5
          Pdra% = (100 / bgf%) * pkts%
         PRINT "Richtige Antworten:";
          COLOR 14, 4
         PRINT pkts%; "von"; bgf%; "gestellten Fragen, das sind"; Pdra%; "Prozent"
      END IF


         GET #1, quest%
           COLOR 10, 3
          FrageU$ = UCASE$(Frage$)
          LOCATE 6, 5
           PRINT FrageU$
          LOCATE 7, 6
           COLOR 8, 4
           PRINT STRING$(71, "฿")
          LOCATE 6, 76
           PRINT "Ü"
        
         COLOR 11, 7
          LOCATE 9, 22
          PRINT " a) "
         COLOR 14, 7
         Center 9, aa$
        
         COLOR 11, 7
          LOCATE 10, 22
          PRINT " b) "
         COLOR 14, 7
         Center 10, ab$

         COLOR 11, 7
          LOCATE 11, 22
          PRINT " c) "
         COLOR 14, 7
         Center 11, ac$

         COLOR 11, 7
          LOCATE 12, 22
          PRINT " d) "
         COLOR 14, 7
         Center 12, ad$

         LOCATE 13, 23
          COLOR 8, 4
         PRINT STRING$(34, "฿")
          LOCATE 9, 56
         PRINT "Ü"
          LOCATE 10, 56
         PRINT "Û"
          LOCATE 11, 56
         PRINT "Û"
          LOCATE 12, 56
         PRINT "Û"
         
        Figure

          LOCATE 15, 6
           COLOR 10, 4
          PRINT "Antwort (a,b,c oder d):"
           COLOR 11, 4
          antw$ = GetString$(15, 30, "", "", 1, 1)
         IF antw$ = Antwort$ THEN Richtig ELSE IF antw$ = "Q" THEN GOTO Menu1 ELSE IF antw$ = "R" THEN bgf% = -1: pkts% = 0 ELSE Falsch
        
         bgf% = bgf% + 1

GOTO start2



'***********
ListeFragen:
'-----------
IF Datei$ = "" THEN RETURN

ClrS "Alle Fragen der geladenen Datei auflisten", "Sie mssen eigentlich nur lesen...", "F1 fr Hilfe, F10 zum Beenden, F5 fhrt zum Hauptmenu"

 TxtWin 3, 4, "Û", "Û", 15, 0, 4

   COLOR 11, 0
    Center 4, UCASE$(Datei$)
  
        X% = 1
        r% = 5

StarteListen:

   FOR i = 1 TO 16
    GET #1, X%
    IF EOF(1) THEN GOTO EndList
      COLOR 11, 0
     LOCATE r%, 4
     PRINT X%
      COLOR 14, 4
     LOCATE r%, 7
     PRINT Frage$
      X% = X% + 1
      r% = r% + 1
    NEXT i

     SLEEP
      TxtWin 3, 4, "Û", "Û", 15, 0, 4
      r% = 5

GOTO StarteListen


EndList:
SLEEP
RETURN



'*********
LoadShell:
'---------
COLOR 7, 0
CLS

PRINT
PRINT "TESTme V1.0d, Qbasic"
PRINT
PRINT "Zur Rckkehr 'EXIT' eingeben..."
SHELL
RETURN


'*****
Hilfe:
'-----
COLOR 7, 0
CLS
SHELL "README.BAT"
GOTO Menu1



'*********
EndOfProg:
'---------
COLOR 7, 0
CLS
PRINT "MKC wnscht ihnen noch einen sch”nen DOS..."
SYSTEM



'******
Fehler:
'------
KEY(1) ON: KEY(5) ON: KEY(10) ON

IF ERR = 53 THEN Datei$ = ""

TxtWin 10, 10, "ฑ", "ฑ", 31, 1, 4
COLOR 14, 4
Center 12, "EIN FEHLER IST AUFGETRETEN"
Center 13, "PROGRAMM KEHRT ZUM HAUPTMENU ZURCK"
SLEEP 4
RESUME Menu1

SUB Begruessung
     KEY(1) ON: KEY(5) ON: KEY(10) ON
    
SLEEP 1
  
   X% = 21
   y% = 13

  FOR i = 1 TO 10
    FOR a = 1 TO 250
    NEXT a
   TxtWin X%, y%, "ฑ", "ฑ", 9, 7, 3
   X% = X% - 2
   y% = y% - 1
  NEXT i
   

SLEEP 1

 COLOR 14, 3
LOCATE 5, 4
PRINT "        ษออออหหหหออออป"
LOCATE , 4
PRINT "        บ    บบบบ    บ"
LOCATE , 4
PRINT "     ฤฤณฤฤฤฤศนฬผฤฤฤฤณฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ"
LOCATE , 4
PRINT "              บบ    ษอออออ- ษอออออป ษอออหอออป ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ"
LOCATE , 4
PRINT "              บบ    บ       บ       ณ   บ   ณ     ษอออปษอออป ษอออออ-"
LOCATE , 4
PRINT "              บบ    ฬออออ-  ศอออออป     บ         บ   บบ   บ บ"
LOCATE , 4
PRINT "             ษนฬป   บ             บ     บ         บ   ะะ   บ ฬออออ-"
LOCATE , 4
PRINT "           ฤอสสสสอ- ศอออออ- ศอออออผ   ฤอสอ-       บ        บ บ"
LOCATE , 4
PRINT "     ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ  ะ        ะ ศอออออ-"
     
 LOCATE 6, 44
  COLOR 12, 3
 PRINT "Copyright (c)1994 MKC und MTI"


        COLOR 4
         Center 14, "Das Lernprogramm fr Schule, Fhrerschein, Lehre und Studium"
      
       LOCATE 15
        COLOR 10, 1
       LOCATE , 5
       PRINT "ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป "
       LOCATE , 5
       PRINT "บ                                                                     บ "
       LOCATE , 5
       PRINT "บ                                                                     บ "
       LOCATE , 5
       PRINT "บ                                                                     บ "
       LOCATE , 5
       PRINT "บ                                                                     บ "
       LOCATE , 5
       PRINT "ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ "
       
        COLOR 11
       Center 16, "Deutsche Erstversion, zur freien Vervielfltigung freigegeben."
       Center 17, "Die SUBS in diesem Programm sind ebenfalls frei kopierbar."
        COLOR 12
       Center 18, "Fr weitere Informationen zum Programm drcken Sie F1"
       Center 19, "Der Autor ist unter der Nummer xxxxxxxxx zu erreichen "

  COLOR 3, 3
 SLEEP

END SUB

SUB Center (row%, text$)
    KEY(1) ON: KEY(5) ON: KEY(10) ON
    LOCATE row%, 41 - LEN(text$) / 2
    PRINT text$;
END SUB

SUB CenterIn (row2%, text2$)
    KEY(1) ON: KEY(5) ON: KEY(10) ON
    LOCATE row2%, 41 - LEN(text2$) / 2
    PRINT text2$;
    INPUT "", cir%

END SUB

SUB ClrS (title$, untitle$, ununtitle$)
  
   KEY(1) ON: KEY(5) ON: KEY(10) ON
   COLOR 9, 1
   CLS
   
    LOCATE 2
     PRINT STRING$(1760, "ฒ")
    
   'titelzeilen:
    
     COLOR , 3
      Center 1, STRING$(80, " ")
      Center 25, STRING$(80, " ")
     COLOR , 2
      Center 24, STRING$(80, " ")
     COLOR 4, 3
      Center 1, title$
      Center 25, untitle$
     COLOR 1, 2
      Center 24, ununtitle$

END SUB

SUB Falsch
    KEY(1) ON: KEY(5) ON: KEY(10) ON
    TxtWin 25, 9, "ฒ", "ฒ", 11, 0, 1
     COLOR 14, 1
     BEEP
    Center 10, "FALSCH !"
     COLOR 4
    Center 11, "Die Richtige Antwort wre"
     COLOR 28
    Center 13, UCASE$(Antwort$)
     COLOR 4
    Center 15, "gewesen "
     SLEEP 3
END SUB

SUB Figure
             
COLOR 11, 4
LOCATE 11, 58
PRINT "              ฑฑฑฑฑ"
LOCATE , 58
PRINT "               ÛÛฑฑ"
LOCATE , 58
PRINT "              ÜÜÛÛÜ"
LOCATE , 58
PRINT "        ฤÜฑฑฑฑฑฑฑÛÛ"
LOCATE , 58
PRINT "              ÛÛÛÛÛ"
LOCATE , 58
PRINT "              ฑฑฑฑฑ"
LOCATE , 58
PRINT "              ฑฑ ฑฑ"
LOCATE , 58
PRINT "              ฑฑ ฑฑ"
LOCATE , 58
PRINT "             ฿฿฿฿฿฿"
'+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--+-++-+-+-

wmes% = (RND * 9) + 1
ON wmes% GOTO 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

WriteMessage:
COLOR 14, 3
LOCATE 14, 39
PRINT Mes1$
GOTO EndOfFigure

1
Mes1$ = " Hallo, wie gehts denn so? "
GOTO WriteMessage

2
Mes1$ = " Pst! Nehmen Sie Antwort A "
GOTO WriteMessage

3
Mes1$ = " Wissen Sie eh nicht! HaHa "
GOTO WriteMessage

4
Mes1$ = "  Ok! Ich bin schon ruhig  "
GOTO WriteMessage

5
Mes1$ = "       Knifflig, was?      "
GOTO WriteMessage

6
Mes1$ = "   Sie langweilen mich!    "
GOTO WriteMessage

7
Mes1$ = " Was,das wissen Sie nicht? "
GOTO WriteMessage

8
Mes1$ = " Sie spielen besser Memory "
GOTO WriteMessage

9
Mes1$ = "  Nur Mut, ich bin fair!   "
GOTO WriteMessage

10
Mes1$ = "  Nicht schlecht bisher!   "
GOTO WriteMessage

EndOfFigure:

END SUB

FUNCTION GetString$ (row%, col%, start$, end$, Vis%, Max%)

DEFINT A-Z
'GetString$:
'  Given a row and col, and an initial string, edit a string
'  VIS is the length of the visible field of entry
'  MAX is the maximum number of characters allowed in the string
    curr$ = Trim$(LEFT$(start$, Max))
    IF curr$ = CHR$(8) THEN curr$ = ""

    LOCATE , , 1

    finished$ = "FALSE"
    DO
        GOSUB GetStringShowText
        GOSUB GetStringGetKey

        IF LEN(Kbd$) < 1 THEN
            finished$ = "TRUE"
            GetString$ = Kbd$
        ELSE
         
            SELECT CASE Kbd$
                CASE CHR$(13), CHR$(27), CHR$(9)
                    finished$ = "TRUE"
                    GetString$ = curr$
          
                CASE CHR$(8)
                    IF curr$ <> "" THEN
                        curr$ = LEFT$(curr$, LEN(curr$) - 1)
                    END IF

                CASE " " TO "}"
                    IF LEN(curr$) < Max THEN
                        curr$ = curr$ + Kbd$
                    ELSE
                        SOUND 3000, 1
                    END IF

                CASE ELSE
                    SOUND 3000, 1
            END SELECT
        END IF

    LOOP UNTIL finished$ = "TRUE"

    end$ = curr$
    LOCATE , , 0
    EXIT FUNCTION



GetStringShowText:
    LOCATE row, col
    IF LEN(curr$) > Vis THEN
        PRINT RIGHT$(curr$, Vis);
    ELSE
        PRINT curr$; SPACE$(Vis - LEN(curr$));
        LOCATE row, col + LEN(curr$)
    END IF
    RETURN

GetStringGetKey:
    Kbd$ = ""
    WHILE Kbd$ = ""
        Kbd$ = INKEY$
    WEND
    RETURN

END FUNCTION

DEFSNG A-Z
SUB KeyIn (k1$, k2$, k3$, k4$, k5$, k6$)
   
   KEY(1) ON: KEY(5) ON: KEY(10) ON
   WHILE a = a
     REM
     IF INKEY$ = k1$ THEN GOTO EndKeyInPos1 ELSE IF INKEY$ = k2$ GOTO EndKeyInPos2 ELSE IF INKEY$ = k3$ GOTO EndKeyInPos3 ELSE IF INKEY$ = k4$ GOTO EndKeyInPos4 ELSE IF INKEY$ = k5$ GOTO EndKeyInPos5 ELSE IF INKEY$ = k6$ GOTO EndKeyInPos6
   WEND

GOTO EndKeyIn

EndKeyInPos1:
 kir = 1
 GOTO EndKeyIn

EndKeyInPos2:
 kir = 2
 GOTO EndKeyIn

EndKeyInPos3:
 kir = 3
 GOTO EndKeyIn

EndKeyInPos4:
 kir = 4
 GOTO EndKeyIn

EndKeyInPos5:
 kir = 5
 GOTO EndKeyIn

EndKeyInPos6:
 kir = 6
 GOTO EndKeyIn

EndKeyIn:
END SUB

SUB MKCIntro

KEY(1) ON: KEY(5) ON: KEY(10) ON
'Das ist das offiziele BasicProgramm zur Darstellung des
'- MKC - Manuel Kiessling Computing, Deutschland GmbH -
'Logos. Es ist entworfen und programmiert vom einzigen Mitarbeiter
'dieser Gesellschaft, MANUEL KIESSLING.
'MKC ist ein SubLabel der MicroTronix Inc., bestehend aus
'Tobias Peiffer und Manuel Kiessling.
'MKC und MTI programmieren in Basic und Pascal.
'
'Greetz to Timm Goergens, Jochen Roelen, Sonja Hahn, Tim Heckhausen,
'Julia Hahn, Daniel Schmitt, Lambert Behnke, Martin Fugel,
'10a des Pascal-Gym. GV, DSA, FKK, Wanderers, NCC
'...und alle die ich vergessen habe.
'
'MegaGreetz to TOBIAS PEIFFER
'
'PROGRAMMED in 1994, on 20th of November, (c) + (r) 1994, MKC, MTI

SLEEP 1

SCREEN 9
CLS
PALETTE 1, 0
PAINT (1, 1), 1

PLAY "MB ML  O1 L4 A L8 E L2 C  O2 L4 A L8 E L2 C  O1 L6 A G E L4 G L2 C L1 C  O2 L4 A L8 E L2 C  O1 L4 A L8 E L2 C  O1 L6 A G E L4 G L2 C L1 C"

 x1 = 324
 y1 = 125
 x2 = 324
 y2 = 125

FOR i = 1 TO 150
 LINE (x1 - 2, y1 - 2)-(x2 + 2, y2 + 2), 15, B
 LINE (x1, y1)-(x2, y2), 11, BF
 LINE (x1 - 1, y1 - 1)-(x2 + 1, y2 + 1), 3, B
  x1 = x1 - 1.5
  y1 = y1 - .5
  x2 = x2 + 1.5
  y2 = y2 + .5
NEXT i

COLOR 1, 27
Center 5, "ษอออออออออออออออออออออออออออออออออออออออออออออป"
Center 6, "บ  ÛÛฒ         ÛÛฒ  ÛÛฒ    ÛÛฒ    ÛÛÛÛÛÛÛฒ    บ"
Center 7, "บ  ÛÛÛÛฒ     ÛÛÛÛฒ  ÛÛฒ  ÛÛฒ    ÛÛฒ      ÛÛฒ  บ"
Center 8, "บ  ÛÛฒ ÛÛฒ ÛÛฒ ÛÛฒ  ÛÛฒÛÛฒ      ÛÛฒ           บ"
Center 9, "บ  ÛÛฒ   ÛÛฒ   ÛÛฒ  ÛÛÛฒ        ÛÛฒ           บ"
Center 10, "บ  ÛÛฒ         ÛÛฒ  ÛÛฒÛÛฒ      ÛÛฒ           บ"
Center 11, "บ  ÛÛฒ         ÛÛฒ  ÛÛฒ  ÛÛฒ    ÛÛฒ      ÛÛฒ  บ"
Center 12, "บ  ÛÛฒ         ÛÛฒ  ÛÛฒ   ÛÛฒ     ÛÛÛÛÛÛÛฒ    บ"
Center 13, "ำฤฤฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฤฤฝ"
COLOR 12, 27


x1 = 322
y1 = 315
x2 = 324
y2 = 315

FOR i = 1 TO 14
LINE (x1 - 2, y1 - 2)-(x2 + 2, y2 + 2), 15, B
LINE (x1, y1)-(x2, y2), 11, BF
LINE (x1 - 1, y1 - 1)-(x2 + 1, y2 + 1), 3, B
x1 = x1 - 12
x2 = x2 + 12
y1 = y1 - .9
y2 = y2 + .9
NEXT i

COLOR 3
Center 23, "SubLabel of the MicroTronix Corporation"

SLEEP 3

x1 = 60
x2 = 60
y1 = 0
y2 = 300
x3 = 585
x4 = 585
y3 = 0
y4 = 300

a1 = 0: a2 = 600: b1 = 20: b2 = 20
a3 = 0: a4 = 600: b3 = 230: b4 = 230

 FOR j = 1 TO 260

LINE (a1, b1)-(a2, b2), 1
LINE (a3, b3)-(a4, b4), 1
b1 = b1 + .4
b2 = b2 + .4
b3 = b3 - .4
b4 = b4 - .4

 LINE (x1, y1)-(x2, y2), 1
x1 = x1 + 1
x2 = x2 + 1
 LINE (x3, y3)-(x4, y4), 1
x3 = x3 - 1
x4 = x4 - 1
 NEXT j

LINE (0, 150)-(600, 600), 1, BF

 x1 = 324
 y1 = 125
 x2 = 324
 y2 = 125

FOR i = 1 TO 50
 LINE (x1 - 2, y1 - 2)-(x2 + 2, y2 + 2), 15, B
 LINE (x1, y1)-(x2, y2), 11, BF
 LINE (x1 - 1, y1 - 1)-(x2 + 1, y2 + 1), 3, B
  x1 = x1 - 1.5
  y1 = y1 - .25
  x2 = x2 + 1.5
  y2 = y2 + .5
NEXT i

COLOR 12
Center 10, "P R E S E N T S"

SLEEP 3

r = 80
FOR i = 1 TO 80
CIRCLE (324 + 1, 132), r, 1
CIRCLE (324 - 1, 132), r, 1
CIRCLE (324, 132 + 1), r, 1
CIRCLE (324, 132 - 1), r, 1
r = r - 1
NEXT i
GOTO Ende

Ende:
SLEEP 2

END SUB

SUB Richtig
    
     KEY(1) ON: KEY(5) ON: KEY(10) ON
     TxtWin 25, 10, "ฒ", "ฒ", 14, 0, 1
     
      COLOR 30, 1
     Center 12, "RICHTIG !"
      pkts% = pkts% + 1
      SLEEP 2
END SUB

SUB TheEnd
   
    KEY(1) ON: KEY(5) ON: KEY(10) ON
    TxtWin 7, 7, "Û", "Û", 15, 9, 4
    COLOR 14, 4
    Center 12, "Wollen Sie das Programm jetzt beenden (j/n)?"

    KeyIn "j", "n", "^", "^", "^", "^"
    
    IF kir = 1 THEN
     TxtWin 15, 10, "Û", "Û", 14, 8, 13
     COLOR 3, 8
     Center 13, "Programm wird beendet..."
    END IF
   
    IF kir = 2 THEN Center 23, "Programm wird nicht beendet"

END SUB

FUNCTION Trim$ (X$)

    IF X$ = "" THEN
        Trim$ = ""
    ELSE
        lastChar = 0
        FOR a = 1 TO LEN(X$)
            y$ = MID$(X$, a, 1)
            IF y$ <> CHR$(0) AND y$ <> " " THEN
                lastChar = a
            END IF
        NEXT a
        Trim$ = LEFT$(X$, lastChar)
    END IF

END FUNCTION

SUB TxtWin (X%, y%, p1$, p2$, fgc%, bgc%, fc%)
  
  KEY(1) ON: KEY(5) ON: KEY(10) ON
  COLOR fgc%, bgc%

    xs% = X%
    ys% = y%
     y% = y% - 3
     X% = X%

     DO UNTIL y% = 26 - ys%
      LOCATE y% + 4, X% + 2
       COLOR 8, 0
      IF NOT y% > 22 - ys% THEN PRINT STRING$(81 - X% - (X% - 1), "ฒ")
      y% = y% + 1
       COLOR fgc%, bgc%
     LOOP


X% = xs%
y% = ys%

     DO
      LOCATE y%, X%
      PRINT p2$
       LOCATE 25 - y%, X%
       PRINT p2$
      X% = X% + 1
     LOOP UNTIL X% = 81 - xs%

    X% = xs%
    y% = ys%

     DO UNTIL y% = 26 - ys%
      LOCATE y%, X%
      PRINT p1$
      LOCATE y%, 81 - X%
      PRINT p1$
      LOCATE y% + 1, X% + 1
       COLOR fc%
      IF NOT y% > 23 - ys% THEN PRINT STRING$(80 - X% - X%, "Û")
      y% = y% + 1
       COLOR fgc%, bgc%
     LOOP

     y% = ys%

END SUB


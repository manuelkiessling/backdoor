PROGRAM Verwaltung;

USES Crt;

Type
  DatTyp = RECORD
             Name        : String[30];
             Gruppe      : String[30];
             Kommentar_1 : String[40];
             Kommentar_2 : String[40];
           END;

VAR
   f         : File of DatTyp;
   InFeld_1  : DatTyp;
   D_Name    : String;
   Pruef_X   : Integer;


Procedure ClearSCR;

 BEGIN;

   WINDOW (1,1,80,25);
    TEXTBACKGROUND (Black);
     CLRSCR;

 END;



PROCEDURE Fenster_XY (X1, Y1, X2, Y2, C1, C2, C3: Byte; E1, E2, E3, E4 : String);

 BEGIN;

  WINDOW (X1, Y1, X2, Y2);
   TEXTBACKGROUND (C3);
    CLRSCR;

   GOTOXY (X1+1, Y1);
    TEXTCOLOR (C2);
     WRITE (E1);

      GOTOXY (X2-1, Y1);
       TEXTCOLOR (C2);
        WRITE (E2);

         GOTOXY (X2-1, Y2);
          TEXTCOLOR (C2);
           WRITE (E3);

            GOTOXY (X1+1, Y2);
             TEXTCOLOR (C2);
              WRITE (E4);

  WINDOW (X1 +2, Y1 +1, X2 -2, Y2 -1);
   TEXTBACKGROUND (C1);
    CLRSCR;

 END;



PROCEDURE Oeffne_Datei;

 BEGIN

   D_Name  := PARAMSTR(1);

       ASSIGN (f, D_Name);

         {$I-};
          RESET (f);
         {$I+};

   IF IORESULT = 0 THEN EXIT ELSE REWRITE (f);

 END;



PROCEDURE Eintrag_Anfuegen;

 LABEL  Start_E_Anfuegen;

 VAR
    LastIn           : LongInt;
    NameX, GruppeX   : String[30];
    Kommentar_1      : String[40];
    Kommentar_2      : String[40];
    J_N              : String[1];

  BEGIN;

    ClearSCR;

       Fenster_XY (1,1,54,10, Blue, LightRed, Green, '\ EINTRAG ANFöGEN', '/', '\', '/');


   Start_E_Anfuegen;

     CLOSE(f);
    Oeffne_Datei;

     CLRSCR;

   LastIn := FileSize(f);
    SEEK (f, LastIn);

   WRITELN ('Eintrag Nr. ',LastIn + 1,' wird angefÅgt.');
   WRITELN;

     TEXTCOLOR (LightRed);
    WRITE ('Name........: ');
     TEXTCOLOR (LightGreen);
    READLN (NameX);
    IF NameX = '' THEN EXIT;

    TEXTCOLOR (LightRed);
    WRITE ('Gruppe......: ');
     TEXTCOLOR (LightGreen);
    READLN (NameX);

     TEXTCOLOR (LightRed);
    WRITE ('Kommentar...: ');
     TEXTCOLOR (LightGreen);
    READLN (NameX);TEXTCOLOR (LightRed);

    WRITE ('Kommentar...: ');
     TEXTCOLOR (LightGreen);
    READLN (NameX);

   WITH InFeld_1 DO BEGIN
                      Name      := NameX;
                      Gruppe    := GruppeX;
                      Kommentar := Kommentar_1;
                      Kommentar := Kommentar_2;
                    END;

         WRITE (f, InFeld_1);

    TEXTCOLOR (Yellow);
   WRITELN;
   WRITE ('Weitere anfÅgen ? ');
   READLN (J_N);

     IF J_N = 'j' THEN GOTO Start_E_Anfuegen;

    EXIT;

  END;



 PROCEDURE Eintrag_Bearbeiten;

  LABEL Start_E_Bearbeiten;

  VAR   Dat_Satz         : Integer;
         J_N              : String[1];

         NameX,GruppeX    : String[30];
         Kommentar_1X     : String[40];
         Kommentar_2X     : String[40];

  BEGIN;

        ClearSCR;

          WINDOW (1,1,60,15);
           Fenster_XY (


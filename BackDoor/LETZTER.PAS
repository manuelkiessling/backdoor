(* Welcome...a great time: our first really serious prog!       02/25-26/95 *)
(* Open a File, enter some Datas and then view them!            ----------- *)
(* Printed in 18/6/1995 *)



{============================================================================}
(*   SOME FACTS: We needed several hours to do this, but it was a time of
    much fun. It's not yet ready, but we'll see!

   WANNA KNOW THE CREDITS?
                              (in alphabetical order)
   Programming..:........Captain Olliwood and Chip-sy-King
    Texts........:........Captain Olliwood and Chip-sy-King
     Graphics(?)..:........Captain Olliwood and Chip-sy-King
      Idea.........:........Captain Olliwood.................
       Layout.......:........Captain Olliwood.................
        Docs'n'Texts.:........Captain Olliwood.................
         Such_Str.....:.............................Chip-sy-King
          Translation..:.............................Chip-sy-King
           Testing......:.............................Chip-sy-King
            SAMPLE.DAT...:........Captain Olliwood.................

         For the good feeling we thank:

                        \- OFFSPRING -\
                         \- R.E.M     -\
                          \- Nirvana   -\

          !!!!!!!! WE PUIK ON PIZZA-TAXI 'DA CARLO' !!!!!!!!


                     €ﬂ‹ BACK
                     €  €ﬂﬂ€
                     €  €  €  GOTTA GET AWAY
                     €  €‹‹€
                     €‹ﬂ DOOR


=========================================================================== *)

PROGRAM FileVerwaltung;

USES Crt;

TYPE
  DatTyp = RECORD
             Name       : String[30];
             Strasse    : String[30];
             PLZ        : String[10];
             Ort        : String[30];
             Geburtstag : String[10];
             Telefon    : String[30];
           END;

VAR
    f         : File of DatTyp;
    InFeld_1  : DatTyp;
    D_Name    : String;
    Pruef_X   : Integer;





PROCEDURE ClearSCR;

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

   D_Name := PARAMSTR(1);

       ASSIGN (f, D_Name);

        {$I-};
         RESET (f);
        {$I+};

   IF IORESULT = 0 THEN EXIT ELSE REWRITE (f);

END;






PROCEDURE Eintrag_Anfuegen;

 LABEL  Start_E_Anfuegen;

 VAR
     LastIn       : LongInt;
     NameX, OrtX  : String;
     StrasseX     : String[30];
     PLZX         : String[10];
     GeburtstagX  : String[10];
     TelefonX     : String[30];
     J_N          : String[1];

  BEGIN;

     ClearSCR;

        Fenster_XY (1,1,54,10, Blue, LightRed, Green, '\ EINTRAG ANFöGEN', '/', '\', '/');




   Start_E_Anfuegen:

     CLOSE(f);
    Oeffne_Datei;

     CLRSCR;

   LastIn := FileSize(f);
    SEEK (f, LastIn);

   WRITELN ('Eintrag Nr. ',LastIn + 1,' wird angefÅgt.');
   WRITELN;

     TEXTCOLOR (LightRed);
    WRITE ('Name.......: ');
     TEXTCOLOR (LightGreen);
    READLN (NameX);
    IF NameX = '' THEN EXIT;

     TEXTCOLOR (LightRed);
    WRITE ('Telefonnr..: ');
     TEXTCOLOR (LightGreen);
    READLN (TelefonX);

     TEXTCOLOR (LightRed);
    WRITE ('Stra·e.....: ');
     TEXTCOLOR (LightGreen);
    READLN (StrasseX);

     TEXTCOLOR (LightRed);
    WRITE ('PLZ........: ');
     TEXTCOLOR (LightGreen);
    READLN (PLZX);

     TEXTCOLOR (LightRed);
    WRITE ('Ort........: ');
     TEXTCOLOR (LightGreen);
    READLN (OrtX);

     TEXTCOLOR (LightRed);
    WRITE ('Geburtstag.: ');
     TEXTCOLOR (LightGreen);
    READLN (GeburtstagX);

   WITH InFeld_1 DO BEGIN
                       Name       := NameX;
                       Strasse    := StrasseX;
                       PLZ        := PLZX;
                       Ort        := OrtX;
                       Geburtstag := GeburtstagX;
                       Telefon    := TelefonX;
                    END;

        WRITE (f, InFeld_1);

   TEXTCOLOR (Yellow);
  WRITELN;
  WRITE ('Weitere anfÅgen? ');
  READLN (J_N);


    IF J_N = 'j' THEN GOTO Start_E_Anfuegen;

   EXIT;

 END;







PROCEDURE Eintrag_Bearbeiten;

 LABEL  Start_E_Bearbeiten;

 VAR    Dat_Satz    : Integer;
        J_N         : String[2];
        Choice      : String[1];

        TelefonX          : String[30];
        NameX, OrtX       : String;
        PLZX, GeburtstagX : String[10];
        StrasseX          : String[30];

  BEGIN;

       ClearSCR;

         WINDOW (1,1,60,15);
          Fenster_XY (1,1,64,17, Blue, LightRed, Green, '\ EINTRéGE BEARBEITEN', '/', '\', '/');

    Start_E_Bearbeiten :

      CLOSE(f);
     Oeffne_Datei;

      CLRSCR;

     TEXTCOLOR (Yellow);
    WRITELN ('Es sind ',FileSize(f),' EintrÑge vorhanden.');
     TEXTCOLOR (LightRed);
    WRITE   ('Welchen Eintrag wollen Sie bearbeiten ? ');
     TEXTCOLOR (LightGreen);
    READLN (Dat_Satz);

      Dat_Satz := Dat_Satz;

     IF Dat_Satz > FileSize(f) THEN
                            BEGIN
                               TEXTCOLOR (LightGreen);
                              WRITELN ('Wollen Sie mich verarschen? - Scrawnk your chick !!!');
                                 TEXTCOLOR (Yellow);
                                WRITELN ('Es sind nur ',FileSize(f),' EintrÑge vorhanden!');

                               DELAY (2000);
                                GOTO Start_E_Bearbeiten;
                            END

                               ELSE
                                 BEGIN
                                   IF Dat_Satz = 0 THEN EXIT;
                                 END;


      SEEK(f, Dat_Satz - 1);



         READ (f, InFeld_1);

          WITH InFeld_1 DO
                       BEGIN
                        CLRSCR;
                          TEXTCOLOR (LightRed);
                         WRITELN ('Nr..: ', Dat_Satz);
                          TEXTCOLOR (LightGreen);
                         WRITELN ('--------------------------------------');
                          TEXTCOLOR (Yellow);
                         WRITELN ('Name........: ',Name);
                         WRITELN ('Telefon.....: ',Telefon);
                         WRITELN ('Stra·e......: ',Strasse);
                         WRITELN ('PLZ.........: ',PLZ);
                         WRITELN ('Ort.........: ',Ort);
                         WRITELN ('Geburtstag..: ',Geburtstag);
                          TEXTCOLOR (LightGreen);
                         WRITELN ('--------------------------------------');
                       END;

    WRITELN;
     TEXTCOLOR (LightGreen);
    WRITE ('Sicher, da· Sie diese Daten Åberschreiben wollen? ');
     TEXTCOLOR (Yellow);
    READLN (J_N);
     IF J_N <> 'j' THEN GOTO Start_E_Bearbeiten;

     TEXTCOLOR (LightRed);
    WRITE ('Name.......: ');
     TEXTCOLOR (LightGreen);
    READLN (NameX);
    IF NameX = '' THEN GOTO Start_E_Bearbeiten;

     TEXTCOLOR (LightRed);
    WRITE ('Telefonnr..: ');
     TEXTCOLOR (LightGreen);
    READLN (TelefonX);

     TEXTCOLOR (LightRed);
    WRITE ('Stra·e.....: ');
     TEXTCOLOR (LightGreen);
    READLN (StrasseX);

     TEXTCOLOR (LightRed);
    WRITE ('PLZ........: ');
     TEXTCOLOR (LightGreen);
    READLN (PLZX);

     TEXTCOLOR (LightRed);
    WRITE ('Ort........: ');
     TEXTCOLOR (LightGreen);
    READLN (OrtX);

     TEXTCOLOR (LightRed);
    WRITE ('Geburtstag.: ');
     TEXTCOLOR (LightGreen);
    READLN (GeburtstagX);

   WITH InFeld_1 DO BEGIN
                       Name    := NameX;
                       Telefon := TelefonX;
                       Strasse := StrasseX;
                       PLZ     := PLZX;
                       Ort     := OrtX;
                       Geburtstag := GeburtstagX;
                    END;


          SEEK(f, Dat_Satz - 1);
         WRITE (f, InFeld_1);


    GOTO Start_E_Bearbeiten;


 END;





PROCEDURE Alles_Ausgeben;

 LABEL Start_A_Ausgeben;

 VAR  Zaehler : Integer;
      a       : Integer;
      J_N     : String[2];


 BEGIN;

      ClearSCR;

     Fenster_XY (1,1,54,25, Black, Yellow, Green, '\ EINTRéGE AUFLISTEN', '/', '\', '/');

   Zaehler := 0;



  Start_A_Ausgeben :

     CLOSE(f);
    Oeffne_Datei;

    CLRSCR;

   a:=0;

   SEEK (f, 0);

  IF FILEPOS(f) = FILESIZE(f) THEN
                                BEGIN
                                  WRITELN ('Keine Daten enthalten !');
                                  WRITE ('RETURN = HauptMenu');
                                  READLN  (J_N);
                                  IF J_N = '' THEN EXIT;
                                END;



  REPEAT

     a := a + 1;

     SEEK (f, Zaehler);

      READ (f, InFeld_1);

     WITH InFeld_1 DO BEGIN
                         TEXTCOLOR (LightRed);
                        WRITELN ('----------------- ', Zaehler + 1,' -----------------');
                         TEXTCOLOR (Yellow);
                        WRITELN (' Name........: ', Name);
                        WRITELN (' Telefon.....: ', Telefon);
                        WRITELN (' Stra·e......: ', Strasse);
                        WRITELN (' PLZ.........: ', PLZ);
                        WRITELN (' Ort.........: ', Ort);
                        WRITELN (' Geburtstag..: ', Geburtstag);
                      END;
     Zaehler := Zaehler + 1;

         IF a = 3 THEN
                   BEGIN
                       IF FILEPOS(f) = FILESIZE(f) THEN
                         BEGIN
                            TEXTCOLOR (LightGreen);
                           WRITELN;
                           WRITE ('--- Ende der Datei ---    ');
                            TEXTCOLOR (LightRed);
                           WRITE ('RETURN = HauptMenu');
                           READLN  (J_N);
                           IF J_N = '' THEN EXIT;
                          END;

                      TEXTCOLOR (LightRed);
                     WRITELN;
                     WRITE ('RETURN = weiter, Q = HauptMenu ');
                     READLN  (J_N);

                     TEXTCOLOR (YELLOW);

                       IF J_N = '' THEN GOTO Start_A_Ausgeben ELSE CLRSCR;
                         EXIT;
                   END;


                       IF FILEPOS(f) = FILESIZE(f) THEN
                         BEGIN
                            TEXTCOLOR (LightGreen);
                           WRITELN;
                           WRITE ('--- Ende der Datei ---    ');
                            TEXTCOLOR (LightRed);
                           WRITE ('RETURN = HauptMenu');
                           READLN  (J_N);
                           IF J_N = '' THEN EXIT;
                         END;

  UNTIL FILEPOS(f) = FILESIZE(f);

 END;




PROCEDURE Abspann;

VAR x,y : Byte;

 BEGIN;

  ClearSCR;

   x := 1;
   y := 1;



   REPEAT

    Fenster_XY (1,1,x,y, Blue, Yellow, Green, '', '', '', '');

     x := x + 1;


    DELAY (10);
   UNTIL x = 80;



   REPEAT

    Fenster_XY (1,1,x,y, Blue, Yellow, Green, '', '', '', '');

     y := y + 1;


    DELAY (10);
   UNTIL y = 25;


    TEXTCOLOR (White);
   WRITELN ('Hope you enjoyed FileWork 1.0 by BackDoor.');
   WRITELN ('It was made in 2/95 by Captain Olliwood(-> c/o) and Chip-sy-King');
   WRITELN;
    TEXTCOLOR (LightGreen);
   WRITELN (' SOME FACTS: We needed several hours to do this, but it was a time of');
   WRITELN (' much fun. It''s not yet ready, but we`ll see!');
   WRITELN;
    TEXTCOLOR (LightRed);
   WRITELN (' WANNA KNOW THE CREDITS?');
   WRITELN ('                           (in alphabetical order)');
    TEXTCOLOR (Yellow);
   WRITELN ('    Programming..:........Captain Olliwood and Chip-sy-King');
   WRITELN ('     Texts........:........Captain Olliwood and Chip-sy-King');
   WRITELN ('      Graphics(?)..:........Captain Olliwood and Chip-sy-King');
   WRITELN ('       Idea.........:........Captain Olliwood.................');
   WRITELN ('        Layout.......:........Captain Olliwood.................');
   WRITELN ('         Docs`n`Texts.:........Captain Olliwood.................');
   WRITELN ('          Such_Str.....:.............................Chip-sy-King');
   WRITELN ('           Translation..:.............................Chip-sy-King');
   WRITELN ('            Testing......:.............................Chip-sy-King');
   WRITELN;
    TEXTCOLOR (LightGreen);
   WRITELN ('         For the good feeling we thank:');
   WRITELN;
    TEXTCOLOR (LightRed);
   WRITELN ('           \- OFFSPRING -\ \- R.E.M. -\ \- Nirvana -\');
    TEXTCOLOR (White);
   WRITE ('.........................................Gotta get away! c/o + Chip-sy-King');


       REPEAT
       UNTIL READKEY <> '';

        NORMVIDEO;
         ClearSCR;
          CLRSCR;

 END;



PROCEDURE CheckIfFileOpen;

 VAR
   Parameter : String;


 BEGIN

  IF PARAMSTR(1) = '' THEN
                       BEGIN

                        CLRSCR;
                         TEXTCOLOR(Red);
                          WRITELN('Sie haben keine Datei im Parameter angegeben!');
                           DELAY(1000);
                          NORMVIDEO;
                           CLRSCR;
                          WRITELN ('Geben sie den Parameter ein  : ');
                          READLN (Parameter);
              Parameter := PARAMSTR

                       END;


 END;







PROCEDURE HauptMenu;

 LABEL StartH_Menu;

 VAR   Funk : Integer;

 BEGIN;

  StartH_Menu:

   Oeffne_Datei;

    ClearSCR;

      FENSTER_XY (1, 1, 51, 14, Blue, Yellow, Red, '\ HAUPTMENö', '/', '\', '/');

   TEXTCOLOR (White);
     WRITELN (' FileWork - 2/95 by BackDoor - Gotta get away!');
     WRITELN;
   TEXTCOLOR (LightBlue);
     WRITELN (' ( ',D_Name,' )');
   TEXTCOLOR (LightGreen);
     WRITELN (' 1.- Neue Daten eingeben');
     WRITELN (' 2.- Alte Daten bearbeiten');
     WRITELN (' 3.- Daten einsehen');
     WRITELN;
   TEXTCOLOR (LightRed);
     WRITELN (' 4.- Quit');
     WRITELN;
   TEXTCOLOR (YELLOW);
     WRITE (' WÑhlen Sie einen Punkt: ');
   TEXTCOLOR (LightGreen);
     READLN (Funk);


    IF Funk = 1 THEN Eintrag_Anfuegen;
    IF Funk = 2 THEN Eintrag_Bearbeiten;
    IF Funk = 3 THEN Alles_Ausgeben;
    IF Funk = 4 THEN EXIT;

       CLOSE(f);

      GOTO StartH_Menu;

 END;




BEGIN

 CheckIfFileOpen;

 ClearSCR;

 HauptMenu;

 Abspann;

END.


{ OK, again thats all. Now go home and.. well, ya know what we mean! }
{ GOTTA GET AWAY! -----> BackDoor }
(* Welcome.. a great time: our first really serious prog!       02/25-26/95 *)
(* Open a File, enter some Datas and then view them!            ----------- *)


{============================================================================}
(* SOME FACTS: We needed several hours to do this, but it was a time of
   much fun. It's not yet ready, but we'll see!

   YOU KNOW THE CREDITS?
                              (in alphabetical order)
        Programming:........Captain Olliwood and Chip-sy-King
        Texts......:........Captain Olliwood and Chip-sy-King
        Graphics(?):........Captain Olliwood and Chip-sy-King
        Idea.......:........Captain Olliwood.................
        Such_Str...:.............................Chip-sy-King
        Translation:.............................Chip-sy-King
        Testing....:.............................Chip-sy-King
        SAMPLE.DAT.:........Captain Olliwood.................

        For the good feeling we thank:
                       - OFFSPRING
                       - R.E.M
                       - Nirvana

          !!!!!!!! WE PUIK ON PIZZA-TAXI DA CARLO !!!!!!!!


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
            Name  : String[30];
             Alter : Integer;
             PLZ   : LongInt;
             Ort   : String[30];
           END;

VAR
    f : File of DatTyp;

    InFeld_1  : DatTyp;

    DateiName : String;

    Pruef_X   : Integer;



PROCEDURE Oeffne_Datei;

 LABEL Start_D_Name;

 VAR  D_Name : String[12];
      J_N    : String[2];
      a      : Integer;

  BEGIN

    a  :=  0;

    Start_D_Name :

    WRITE ('Geben Sie den Dateinamen ein   : ');
    READLN (D_Name);

    a := a + 1;
    IF a > 1 THEN CLOSE (f);

    IF D_Name = '' THEN EXIT;

   ASSIGN (f, D_Name);

   {$I-};
    RESET (f);
   {$I+};

   IF IORESULT = 0 THEN
                    BEGIN
                     Pruef_X := 1;
                      WRITELN ('Datei ',D_Name,' wird geîffnet !');
                      DELAY (1000);
                       DateiName := D_Name;
                     EXIT;
                    END

                   ELSE
                    BEGIN
                     WRITE ('Datei ist nicht vorhanden. Neu erstellen? ');
                     READLN (J_N);
                    END;

                    IF J_N = 'ja' THEN
                                    BEGIN
                                      REWRITE (f);
                                      DateiName := D_Name;
                                    END
                                  ELSE GOTO Start_D_Name;


    EXIT;

  END;



PROCEDURE Eintrag_Anfuegen;

 LABEL  Start_E_Anfuegen;

 VAR
     LastIn       : LongInt;
     NameX, OrtX  : String;
     AlterX       : Integer;
     PLZX         : LongInt;
     J_N          : String[2];

  BEGIN;

    IF Pruef_X <> 1 THEN
               BEGIN
                 TEXTCOLOR (LightRed+Blink);
                 WRITELN ('Noch keine Datei geîffnet !');
                 DELAY (2000);
                 EXIT;
               END;


   Start_E_Anfuegen:

   LastIn := FileSize(f);
    SEEK (f, LastIn);

   WRITE ('Eintrag Nr. ',LastIn + 1,' wird angefÅgt.');
   WRITELN;

    WRITE ('Name.......: ');
    READLN (NameX);
    IF NameX = '' THEN EXIT;

    WRITE ('Alter......: ');
    READLN (AlterX);

    WRITE ('PLZ........: ');
    READLN (PLZX);

    WRITE ('Ort........: ');
    READLN (OrtX);

   WITH InFeld_1 DO BEGIN
                       Name  := NameX;
                       Alter := AlterX;
                       PLZ   := PLZX;
                       Ort   := OrtX;
                    END;

        WRITE (f, InFeld_1);

  WRITE ('Weitere anfÅgen ? ');
  READLN (J_N);

    IF J_N = 'ja' THEN GOTO Start_E_Anfuegen;

   EXIT;

  END;


PROCEDURE Eintrag_Bearbeiten;

 LABEL  Start_E_Bearbeiten;

 VAR    Dat_Satz    : Integer;
        J_N         : String[2];

        NameX, OrtX : String;
        PLZX        : LongInt;
        AlterX      : Integer;

  BEGIN;

      IF Pruef_X <> 1 THEN
               BEGIN
                 TEXTCOLOR (LightRed+Blink);
                 WRITELN ('Noch keine Datei geîffnet !');
                 DELAY (2000);
                 EXIT;
               END;

    Start_E_Bearbeiten :

    WRITELN ('Es sind ',FileSize(f),' EintrÑge vorhanden.');
    WRITE   ('Welchen Eintrag wollen Sie bearbeiten ? ');
    READLN (Dat_Satz);

      Dat_Satz := Dat_Satz;

     IF Dat_Satz > FileSize(f) THEN
                            BEGIN
                              WRITE ('Wollen Sie mich verarschen? - Srawnk your chick!!!');
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
                          TEXTCOLOR (Red);
                         WRITELN ('Nr..: ',Dat_Satz);
                         WRITELN ('----------');
                          TEXTCOLOR (Green);
                         WRITELN ('Name....: ',Name);
                         WRITELN ('Alter...: ',Alter);
                         WRITELN ('PLZ.....: ',PLZ);
                         WRITELN ('Ort.....: ',Ort);
                          TEXTCOLOR (Red);
                         WRITELN ('--------------------');
                       END;

    WRITELN;
    WRITE ('Sind Sie sicher, da· Sie diese Daten Åberschreiben wollen?');
    READLN (J_N);
     IF J_N <> 'ja' THEN GOTO Start_E_Bearbeiten;


    WRITE ('Name.......: ');
    READLN (NameX);
    IF NameX = '' THEN GOTO Start_E_Bearbeiten;

    WRITE ('Alter......: ');
    READLN (AlterX);

    WRITE ('PLZ........: ');
    READLN (PLZX);

    WRITE ('Ort........: ');
    READLN (OrtX);

   WITH InFeld_1 DO BEGIN
                       Name  := NameX;
                       Alter := AlterX;
                       PLZ   := PLZX;
                       Ort   := OrtX;
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

   IF Pruef_X <> 1 THEN
               BEGIN
                 TEXTCOLOR (LightRed+Blink);
                 WRITELN ('Noch keine Datei geîffnet !');
                 DELAY (2000);
                 EXIT;
               END;

   Zaehler := 0;

  Start_A_Ausgeben :

   a:=0;

   SEEK (f, 0);

  IF FILEPOS(f) = FILESIZE(f) THEN
                                BEGIN
                                  WRITELN ('Keine Daten enthalten !');
                                  WRITELN ('RETURN = HauptMenu');
                                  READLN  (J_N);
                                  IF J_N = '' THEN EXIT;
                                END;
                             


  REPEAT

     a := a + 1;

     SEEK (f, Zaehler);

      READ (f, InFeld_1);

     WITH InFeld_1 DO BEGIN
                        WRITELN ('------ ', Zaehler + 1,' ------');
                        WRITELN ('Name...: ', Name);
                        WRITELN ('Alter..: ', Alter);
                        WRITELN ('PLZ....: ', PLZ);
                        WRITELN ('Ort....: ', Ort);
                        WRITELN ('----------------------');
                        WRITELN;
                      END;
     Zaehler := Zaehler + 1;

         IF a = 3 THEN
                   BEGIN
                       IF FILEPOS(f) = FILESIZE(f) THEN
                         BEGIN
                            TEXTCOLOR (Green);
                           WRITELN ('--- Ende der Datei ---');
                            TEXTCOLOR (Red);
                           WRITELN ('RETURN = HauptMenu : ');
                           READLN  (J_N);
                           IF J_N = '' THEN EXIT;
                          END;
                     WRITELN;
                      TEXTCOLOR (Red);
                     WRITELN ('RETURN = weiter, Q = HauptMenu: ');
                     READLN  (J_N);

                     TEXTCOLOR (YELLOW);

                       IF J_N = '' THEN GOTO Start_A_Ausgeben ELSE EXIT;
                   END;

  UNTIL FILEPOS(f) = FILESIZE(f);
 END;


Procedure HauptMenu;

 LABEL StartH_Menu;
 VAR   Funk : Integer;

 BEGIN;

  StartH_Menu:

    CLRSCR;

   TEXTCOLOR (LightGray);
     WRITELN ('FileWork - 2/95 by BackDoor - Gotta get away!');

   TEXTCOLOR (Green);
     WRITELN ('1.- Datei îffnen');
   TEXTCOLOR (Blue);
     WRITELN ('geîffnete Datei : ',DateiName);
   TEXTCOLOR (Green);
     WRITELN ('2.- Neue Daten eingeben');
     WRITELN ('3.- Alte Daten bearbeiten');
     WRITELN ('4.- Daten einsehen');
     WRITELN;
   TEXTCOLOR (Red);
     WRITELN ('5.- Quit');
     WRITELN;
   TEXTCOLOR (YELLOW);
     WRITE ('WÑhlen Sie einen Punkt: ');
     READLN (Funk);

    IF Funk = 1 THEN Oeffne_Datei;
    IF Funk = 2 THEN Eintrag_Anfuegen;
    IF Funk = 3 THEN Eintrag_Bearbeiten;
    IF Funk = 4 THEN Alles_Ausgeben;
    IF Funk = 5 THEN
                  BEGIN;
                    CLRSCR;
                      TEXTCOLOR (Red);
                     WRITELN ('Remember BackDoor when you gotta get away!');
                      TEXTCOLOR (LightGray);
                     WRITELN ('Have a nice DOS...');
                        EXIT;
                   END;

     GOTO StartH_Menu;

 END;


  LABEL NeueEingabe;
  LABEL Anzeigen;

BEGIN

  DateiName := '';

   CLRSCR;

    HauptMenu;

   TEXTCOLOR (LightGray);
    DELAY (3000);
    CLRSCR;

END.

{ OK, again thats all. Now go home and.. well ya know what we mean! }
{ GOTTA GET AWAY! -----> BackDoor }
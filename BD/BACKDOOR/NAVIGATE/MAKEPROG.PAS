(* A prog that makes files that contain progpathes to load with NAVIGATE *)
(* by BackDoor 18/6/1995 *)


PROGRAM Navigate_Program_File_Maker;

USES Crt;

TYPE DatTyp = RECORD
                    Name      : String[30];
                    Programm  : String[30];
                    Directory : String[30];
                  END;

VAR InputField : DatTyp;
    f          : File of DatTyp;








PROCEDURE TextMitte (Zeile : Integer; Text : String);

BEGIN

 GOTOXY (40 - (Length(Text) div 2), Zeile);

 WRITE (Text);

END;








PROCEDURE DateiInit(DName : String);

BEGIN;

  CLRSCR;

     ASSIGN (f, DName);

      {$I-};
       RESET(f);
      {$I+};

       IF IORESULT = 0 THEN
                        BEGIN
                           WRITELN;
                            TEXTCOLOR(15);
                            WRITELN('Datei ', DName, ' wird ge”ffnet...');
                           DELAY (1000);
                        END

                        ELSE
                         BEGIN
                            REWRITE(f);
                             WRITELN;
                              TEXTCOLOR(15);
                              WRITELN('Datei ', DName, ' wird neu erstellt...');
                             DELAY (1000);
                        END;



END;







PROCEDURE NeueEingabe;

VAR ProgrammX, NameX, DirectoryX : String;

BEGIN;

  DateiInit(ParamStr(1));

 CLRSCR;

  TEXTCOLOR(15);
   WRITELN('ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ');
  TEXTCOLOR(11);
   WRITELN('Neue Eingabe an Dateiende anfgen');
  TEXTCOLOR(15);
   WRITELN('ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ');


       WRITELN;
      TEXTCOLOR(3);
       WRITELN('Eingaben insgesamt: ', FileSize(f));
       WRITE('Setze Zeiger auf Dateiende... ');
        SEEK(f, FileSize(f));
       WRITELN('OK');


          WRITELN;
          WRITELN;

         TEXTCOLOR(15);
          WRITELN;
          WRITE('Geben Sie den Programmnamen ein: ');
         TEXTCOLOR(11);
          READLN(NameX);
           IF NameX = '' THEN EXIT;

         TEXTCOLOR(15);
          WRITELN;
          WRITE('Geben Sie die Programmdatei an (mit Pfad): ');
         TEXTCOLOR(11);
          READLN(ProgrammX);
           IF ProgrammX = '' THEN EXIT;

         TEXTCOLOR(15);
          WRITELN;
          WRITE('Geben Sie das Arbeitsverzeichnis an: ');
         TEXTCOLOR(11);
          READLN(DirectoryX);
           IF DirectoryX = '' THEN EXIT;


               WITH InputField DO BEGIN
                                   Programm  := ProgrammX;
                                   Name      := NameX;
                                   Directory := DirectoryX;
                                  END;

                WRITE(f, InputField);

     CLOSE(f);

END;









PROCEDURE EingabenBearbeiten;

VAR ProgrammX, NameX, DirectoryX : String;
    SetWhere : Integer;

BEGIN;

  DateiInit(ParamStr(1));

 CLRSCR;

  TEXTCOLOR(15);
   WRITELN('ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ');
  TEXTCOLOR(11);
   WRITELN('Vorhandene Eingaben bearbeiten');
  TEXTCOLOR(15);
   WRITELN('ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ');


       WRITELN;
      TEXTCOLOR(3);
       WRITELN('Eingaben insgesamt: ', FileSize(f));
       WRITELN;


       TEXTCOLOR(15);
       WRITE('Geben Sie an, auf welchen Eintrag Sie den Dateizeiger setzen m”chten: ');
      TEXTCOLOR(11);
       READLN(SetWhere);


      TEXTCOLOR(3);
       WRITELN;
       WRITE('Setze Zeiger auf gewnschte Position... ');
        SEEK(f, SetWhere -1);   {'-1' muss angegeben sein, weiá Gott warum};
       WRITELN('OK');
       WRITELN;
       WRITELN;



               READ(f, InputField);

              WITH InputField DO BEGIN
                                  TEXTCOLOR(11);
                                   WRITELN(Name);
                                   WRITELN(Programm);
                                   WRITELN(Directory);
                                 END;


         TEXTCOLOR(15);
          WRITELN;
          WRITELN;
          WRITE('Geben Sie den Programmnamen ein: ');
         TEXTCOLOR(11);
          READLN(NameX);
           IF NameX = '' THEN EXIT;

         TEXTCOLOR(15);
          WRITELN;
          WRITE('Geben Sie die Programmdatei an (mit Pfad): ');
         TEXTCOLOR(11);
          READLN(ProgrammX);
           IF ProgrammX = '' THEN EXIT;

         TEXTCOLOR(15);
          WRITELN;
          WRITE('Geben Sie das Arbeitsverzeichnis an: ');
         TEXTCOLOR(11);
          READLN(DirectoryX);
           IF DirectoryX = '' THEN EXIT;


              SEEK(f, SetWhere -1);
               WITH InputField DO BEGIN
                                   Programm  := ProgrammX;
                                   Name      := NameX;
                                   Directory := DirectoryX;
                                  END;

                WRITE(f, InputField);

     CLOSE(f);

END;










PROCEDURE ZeigeEingaben;

BEGIN;
END;









PROCEDURE TheEnd;

BEGIN

  CLRSCR;

 TEXTCOLOR(3);
  WRITE('Thanx for using ');
 TEXTCOLOR(11);
  WRITELN('BackDoors NAVIGATE ProgMaker Version 1.0');
 TEXTCOLOR(15);
  WRITELN('ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ');
 TEXTCOLOR(2);
  WRITELN('From June 1995, mainprogging by C/O');

   WRITELN;
    NORMVIDEO;

   HALT;

END;













PROCEDURE InitAll;

BEGIN;

 IF ParamStr(1) = '' THEN
                      BEGIN
                       CLRSCR;

                        TEXTCOLOR(12);
                        WRITELN('Sie haben keine ProgDatei als Kommandozeilenparameter angegeben.');
                        WRITELN('Programm wird beendet');
                         DELAY (2000);

                          TheEnd;
                       END;

END;









PROCEDURE HauptMenu;

VAR Wahl : Integer;

LABEL Beginn;

BEGIN;
 Beginn:

  CLRSCR;

   TEXTCOLOR(15);
    TextMitte (4, 'ÜÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÜ');
   TEXTCOLOR(3);
    TextMitte (5, 'BackDoors Navigate-ProgMaker');
   TEXTCOLOR(11);
    TextMitte (6, 'H A U P T M E N U');
   TEXTCOLOR(15);
    TextMitte (7, 'ßÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄß');

   TEXTCOLOR(10);
    TextMitte (10, '1 ¯->          Neue ProgMaske anfgen');
    TextMitte (11, '2 ¯-> Vorhandene ProgMaske bearbeiten');
    TextMitte (12, '3 ¯->      Gesamte ProgMaske einsehen');
    TextMitte (13, '4 ¯->              Programm verlassen');



    REPEAT

      TEXTCOLOR(2);
    TextMitte (15, 'Geben Sie ihre Wahl an: ');
      TEXTCOLOR(11);
       READLN (Wahl);

    UNTIL Wahl > 0;


        CASE Wahl OF

         1 : NeueEingabe;
         2 : EingabenBearbeiten;
         3 : ZeigeEingaben;
         4 : EXIT;

        END;

    GOTO Beginn;

END;











BEGIN

  InitAll;
  HauptMenu;
  TheEnd;

END.

(* Copyright BackDoor 1995, Mainprogging by Captain Olliwood *);
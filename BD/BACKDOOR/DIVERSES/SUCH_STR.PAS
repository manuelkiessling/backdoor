{ This program is made by BackDoor 2/95 }
{ ------------ HAVE FUN --------------- }


PROGRAM SuchStringProgramm;

Uses Crt;

TYPE
   DatTyp = RECORD
               Titel : String[20]
            END;

VAR  Eingabe  : string;
     TeilStrg : string;
     Ausgabe  : string;
     Zeig     : string;

     DatEin   : DatTyp;
     DatEin2  : DatTyp;

     Start    : integer;
     BisWo    : integer;

     f        : File of DatTyp;

PROCEDURE Oeffne_Datei (Name : String);


 LABEL Ende4;


  BEGIN
   ASSIGN (f, Name);

   {$I-};
    RESET (f);
   {$I+};

   IF IORESULT = 0 THEN GOTO Ende4 ELSE REWRITE (f);


   Ende4:

  END;



PROCEDURE TeilStrErmitteln (s : string; Anf, Anz : integer);

  BEGIN;

       	Ausgabe := COPY (s, Anf, Anz);

  END;




PROCEDURE Suche_Wort (Wort : String; Such_Str : String);

 VAR  Anf, Ende2: Integer;
      i : Integer;

      LABEL Ende;

  BEGIN

     Anf   := 0;
     Ende2 := Length(Such_Str);


   REPEAT

     Anf := Anf + 1;

     TeilStrErmitteln (Wort, Anf, Ende2);

      For i := 1 TO Length(Such_Str) DO

        BEGIN;

           Such_Str[i] := UPCASE(Such_Str[i]);
           Ausgabe[i]  := UPCASE(Ausgabe[i]);

        END;

     IF Such_Str = Ausgabe THEN WRITELN('Wort gefunden!!!');
     IF Such_Str = Ausgabe THEN GOTO Ende;

   UNTIL Anf + Ende2 = Length(Wort)+1;

    Ende:

  END;


BEGIN

 ClrScr;


   Oeffne_Datei ('test.dat');

    SEEK(f, 0);

     WITH DatEin DO BEGIN
           WRITE ('Titel...:'); READLN (Titel);
     END;

    WRITE (f, DatEin);

     WITH DatEin2 DO BEGIN
           WRITE ('Titel2...:'); READLN (Titel);
     END;

    WRITE (f, DatEin2);

    SEEK (f, 0);

        READLN (Eingabe);

      READ (f, DatEin);
     WITH DatEin DO BEGIN
            Suche_Wort (Titel, Eingabe);
         END;



END.

{ That's all folks! Go home now and scrawnk your chick! }
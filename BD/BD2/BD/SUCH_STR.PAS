{ This program is made by BackDoor 2/95 }
{ ------------ HAVE FUN --------------- }


PROGRAM TeilStringErmitteln;

Uses Crt;

VAR Eingabe  : string;
    TeilStrg : string;
    Ausgabe  : string;

    Start    : integer;
    BisWo    : integer;



PROCEDURE TeilStrErmitteln (s : string; Anf, Anz : integer);

  BEGIN;

       	Ausgabe := COPY (s, Anf, Anz);

  END;




PROCEDURE Suche_Wort (Wort : String; Such_Str : String);

 VAR
    Anf, Ende2: Integer;

    LABEL Ende;

  BEGIN

     Anf := 0;
     Ende2 := Length(Such_Str);

   REPEAT

     Anf := Anf + 1;

     TeilStrErmitteln (Wort, Anf, Ende2);

     IF Such_Str = Ausgabe THEN WRITELN('Wort gefunden!!!');
     IF Such_Str = Ausgabe THEN GOTO Ende;

   UNTIL Anf + Ende2 = Length(Wort)+1;

    Ende:

  END;


BEGIN

   READLN (Eingabe);

   Suche_Wort ('BackDoor - Gotta get away!', Eingabe);

END.

{ That's all folks! Go home now and scrawnk your chick! }
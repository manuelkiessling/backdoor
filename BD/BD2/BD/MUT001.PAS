PROGRAM TeilStringErmitteln;

Uses WinCrt;

VAR Eingabe  : string;
    TeilStrg : string;
    Ausgabe  : string;

    Start    : integer;
    BisWo    : integer;



PROCEDURE TeilStrErmitteln (s : string; Anf, Anz : integer);


  BEGIN;

    	Ausgabe := COPY (s, Anf, Anz);

  END;




BEGIN

	WRITE  ('Wie soll der zu bearbeitende STRING lauten? ');
	READLN (Eingabe);

	WRITE  ('Ab welchem Zeichen soll der TEILSTRING entnommen werden? ');
	READLN (Start);

	WRITE  ('Wieviel Zeichen soll der TEILSTRING enthalten? ');
	READLN (BisWo);


	 TeilStrErmitteln (Eingabe, Start, BisWo);

	  WRITELN;
	  WRITELN (Ausgabe);

END.
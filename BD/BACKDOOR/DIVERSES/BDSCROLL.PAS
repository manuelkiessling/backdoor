PROGRAM ScrollTextInGraphMode;

USES Crt, Graph;


VAR Taste : String;
    YY : Integer;




PROCEDURE Ausgeben(Y : Integer);

BEGIN;

SETTEXTSTYLE(DefaultFont,HorizDir,1);
CLEARVIEWPORT;

SETCOLOR(11);
OUTTEXTXY(0,0+Y,'Zeile 1');
OUTTEXTXY(0,19+Y,'Zeile 2');
OUTTEXTXY(0,38+Y,'Zeile 3');
OUTTEXTXY(0,57+Y,'Zeile 4');
OUTTEXTXY(0,76+Y,'Zeile 5');
OUTTEXTXY(0,95+Y,'Zeile 6');
OUTTEXTXY(0,114+Y,'Zeile 7');
OUTTEXTXY(0,133+Y,'Zeile 8');
OUTTEXTXY(0,152+Y,'Zeile 9');
OUTTEXTXY(0,171+Y,'Zeile 10');
OUTTEXTXY(0,190+Y,'Zeile 11');
OUTTEXTXY(0,209+Y,'Zeile 12');
OUTTEXTXY(0,228+Y,'Zeile 13');
OUTTEXTXY(0,247+Y,'Zeile 14');
OUTTEXTXY(0,266+Y,'Zeile 15');
OUTTEXTXY(0,285+Y,'Zeile 16');
OUTTEXTXY(0,304+Y,'Zeile 17');
OUTTEXTXY(0,323+Y,'Zeile 18');
OUTTEXTXY(0,342+Y,'Zeile 19');
OUTTEXTXY(0,361+Y,'Zeile 20');
OUTTEXTXY(0,380+Y,'Zeile 21');
OUTTEXTXY(0,399+Y,'Zeile 22');
OUTTEXTXY(0,418+Y,'Zeile 23');
OUTTEXTXY(0,437+Y,'Zeile 24');
OUTTEXTXY(0,456+Y,'Zeile 25');
OUTTEXTXY(0,475+Y,'Zeile 26');

END;






PROCEDURE SetInGraphMode (PathToDriver : String);

 VAR grDrv, grMd, OccErr : Integer;


 BEGIN
   grDrv := VGA;
   grMd  := VGAHi;

  InitGraph (grDrv, grMd, PathToDriver);

   OccErr := GraphResult;

   IF OccErr = grOk THEN
    BEGIN
     EXIT;
    END
  ELSE
   BEGIN
    WRITELN;
     TEXTCOLOR (LightRed+Blink);
    WRITE('ERROR: ');
     TEXTCOLOR (Yellow);
    WRITELN(GraphErrorMsg(OccErr));
     HALT;
   END;

 CLRSCR;

END;






PROCEDURE What_Now;

BEGIN

   IF Taste = '8' THEN
    BEGIN

     YY := YY -19;

      Ausgeben(YY);

    END;



   IF Taste = '2' THEN
    BEGIN

     YY := YY +19;

      Ausgeben(YY);

    END;

END;






PROCEDURE Wait_Input;

BEGIN

 REPEAT
      Taste := READKEY;
       IF Taste <> ' ' THEN What_Now;
 UNTIL 1 = 2;

END;





BEGIN

YY := 10;

SetInGraphMode('d:\backdoor\navigate');

SETVIEWPORT(0,0,100,480,TRUE);

Ausgeben(0);

Wait_Input;

END.
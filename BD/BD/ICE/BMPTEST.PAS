PROGRAM Test_Unit_BMP16;


USES Crt, Graph, Bmp16;

VAR PathToDriver, WhichBMP : String;



PROCEDURE S_W_Palette;

VAR i : Integer;


BEGIN;

 FOR i := 0 TO 15 DO SETRGBPALETTE (i, i+10, i+10, i+0);

END;




PROCEDURE SetInGraphMode;

 VAR grDrv, grMd, OccErr : Integer;


 BEGIN
   grDrv := Detect;

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


PROCEDURE Fuellbild;

VAR Groesse  : Word;
    P        : Pointer;
    Zaehler1 : Integer;
    Zaehler2 : Integer;

BEGIN

  Groesse := ImageSize (0, 0, Bitmap_Width, Bitmap_Heigth);
  GETMEM (P, Groesse);

   PUTBMP(0, Bitmap_Heigth -1, WhichBMP);
   GETIMAGE (0, 0, Bitmap_Width -1, Bitmap_Heigth -1, P^);

    CLRSCR;

     Zaehler1 := 0;
     Zaehler2 := 0;

REPEAT

        REPEAT


         PUTIMAGE (Zaehler1 * Bitmap_Width, Zaehler2 * Bitmap_Heigth, P^, NormalPut);

         Zaehler2 := Zaehler2 + 1;

        UNTIL Zaehler2 = 480 div Bitmap_Width;

  Zaehler1 := Zaehler1 + 1;
  Zaehler2 := 0;

UNTIL Zaehler1 = 640 div Bitmap_Heigth;



END;



BEGIN

 PathToDriver := 'D:\TP60\BGI';
 WhichBMP := 'C:\WINDOWS\wabe.BMP';

 SetInGraphMode;

 GET_BITMAPSCALE (WhichBMP);

 Fuellbild;


 REPEAT UNTIL KEYPRESSED;

END.
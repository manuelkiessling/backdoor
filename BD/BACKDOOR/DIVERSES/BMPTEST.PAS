(* Little playing with BMP.TPU. Perhaps the 2nd Intro? *)
(* by BackDoor. 18/6/1995 *)


PROGRAM Test_Unit_BMP16;


USES Crt, Graph, Bmp16;

VAR PathToDriver, WhichBMP : String;
    Pic1 : Pointer;


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


PROCEDURE Fuellbild (BV : Pointer);

VAR Groesse  : Word;
    Zaehler1 : Integer;
    Zaehler2 : Integer;

BEGIN


     Zaehler1 := 0;
     Zaehler2 := 0;

REPEAT

        REPEAT

         PUTIMAGE (Zaehler1 * Bitmap_Width, Zaehler2 * Bitmap_Heigth, BV^, NormalPut);

         Zaehler2 := Zaehler2 + 1;

        UNTIL Zaehler2 = 480 div Bitmap_Heigth;

  Zaehler1 := Zaehler1 + 1;
  Zaehler2 := 0;

UNTIL Zaehler1 = 640 div Bitmap_Width;



END;




PROCEDURE Text_Mittig_G (Zeile, Plus : Integer; Text : String);

BEGIN

OUTTEXTXY((320 - TextWidth(Text) div 2) + Plus, Zeile, Text);

END;




BEGIN

 PathToDriver := 'C:\TP60\BGI';
 WhichBMP := 'C:\TP60\SAVE\ICE\BMP\ziegel.BMP';

  SetInGraphMode;

 GET_BITMAPSCALE(WhichBMP);
  PUTBMP(0, Bitmap_Heigth -1, WhichBMP);
   GETMEM (Pic1, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
    GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, Pic1^);


 Fuellbild (Pic1);



 SETTEXTSTYLE (TriplexFont, HorizDir, 10);

 SETCOLOR(0);
  Text_Mittig_G (50,0,'BackDoor');
   SETCOLOR (8);
    Text_Mittig_G (51,1,'BackDoor');
     SETCOLOR (15);
      Text_Mittig_G (49,-1,'BackDoor');
       SETCOLOR (11);
        Text_Mittig_G (49,-2,'BackDoor');



  SETTEXTSTYLE (TriplexFont, HorizDir, 5);

  SETCOLOR(0);
   Text_Mittig_G (200,0,'Gotta Get Away');
    SETCOLOR (8);
     Text_Mittig_G (201,1,'Gotta Get Away');
      SETCOLOR (15);
       Text_Mittig_G (199,-1,'Gotta Get Away');
        SETCOLOR (14);
         Text_Mittig_G (199,-2,'Gotta Get Away');


 REPEAT UNTIL KEYPRESSED;

 Fuellbild (Pic1);

END.
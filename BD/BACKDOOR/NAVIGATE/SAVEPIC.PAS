PROGRAM SavePicInBD_FORMAT;

USES Crt, Graph, Bmp16;

TYPE DatTyp = RECORD
               Dimension : Array[1..4] OF Integer;
               Buffer    : Array[1..250] OF String[250];
              END;

VAR f     : File of DatTyp;
    field : DatTyp;










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









PROCEDURE LoadBMP;

BEGIN;

 GET_BITMAPSCALE(ParamStr(1));
   PUTBMP(0, Bitmap_Heigth -1, ParamStr(1));

END;









PROCEDURE DateiInit(DName : String);

BEGIN;

     ASSIGN (f, DName);

      {$I-};
       RESET(f);
      {$I+};

                IF IORESULT <> 0 THEN REWRITE(f);


END;









PROCEDURE SavePic(FileName : String; x1,y1,x2,y2 : Integer);

VAR CurrPix, SX1, SY1 : Integer;
    PixStr    : String;
    Zaehler,i : Integer;

    Ident : String[80];

BEGIN

             Ident := 'BackDoor Picture File V 1.0. Made with `SavePicture` V1.0 from 6/95 by C/O.      ';


   SX1 := x1;
   SY1 := y1;
   Zaehler := 2;



 DateiInit(FileName);

  SEEK(f,0);

   WITH field DO BEGIN
                  Dimension[1] := x1;
                  Dimension[2] := y1;
                  Dimension[3] := x2;
                  Dimension[4] := y2;
                  Buffer[1] := Ident;
                 END;

    WRITE(f, field);

     CLOSE(f);




   REPEAT;

    REPEAT;


      CurrPix := GETPIXEL(x1,y1);
      PUTPIXEL(x1,y1,CurrPix-1);

       CASE CurrPix OF
                      0 : PixStr := PixStr + '0';
                      1 : PixStr := PixStr + '1';
                      2 : PixStr := PixStr + '2';
                      3 : PixStr := PixStr + '3';
                      4 : PixStr := PixStr + '4';
                      5 : PixStr := PixStr + '5';
                      6 : PixStr := PixStr + '6';
                      7 : PixStr := PixStr + '7';
                      8 : PixStr := PixStr + '8';
                      9 : PixStr := PixStr + '9';
                     10 : PixStr := PixStr + 'A';
                     11 : PixStr := PixStr + 'B';
                     12 : PixStr := PixStr + 'C';
                     13 : PixStr := PixStr + 'D';
                     14 : PixStr := PixStr + 'E';
                     15 : PixStr := PixStr + 'F';
       END;

      x1 := x1 +1;

     UNTIL x1 = x2 +1;

     

       WITH field DO BEGIN;
                       Buffer[Zaehler] := PixStr;
                     END;



       x1 := SX1;
       y1 := y1 +1;
       Zaehler := Zaehler +1;
       PixStr := '';

    UNTIL y1 = y2 +1;

     DateiInit(FileName);
      SEEK(f,0);
       WRITE(f, field);
        CLOSE(f);

      HALT;

END;









BEGIN

 SetInGraphMode('.\');

 LoadBmp;

  IF Bitmap_Heigth > 250 THEN Bitmap_Heigth := 250;
   IF Bitmap_Width > 250 THEN Bitmap_Width := 250;

 SavePic(ParamStr(2), 0,0,Bitmap_Width,Bitmap_Heigth);

END.
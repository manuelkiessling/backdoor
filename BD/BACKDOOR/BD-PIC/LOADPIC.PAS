(* This is a Prog which views Pics in BD Format. 18/6/1995 *);
(* by BackDoor *);


PROGRAM LoadPicInBD_FORMAT;

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










PROCEDURE DateiInit(DName : String);

BEGIN;

     ASSIGN (f, DName);

      {$I-};
       RESET(f);
      {$I+};

                IF IORESULT <> 0 THEN REWRITE(f);


END;











PROCEDURE LoadPic(FileName : String; x,y : Integer);

VAR x1, y1, x2, y2, sx, sy : Integer;
    CurrPix, PixStr        : String;
    Zaehler,i              : Integer;


BEGIN

   Zaehler := 2;



 DateiInit(FileName);

  SEEK(f,0);

   READ(f, field);

   WITH field DO BEGIN
                  x1 := Dimension[1];
                  y1 := Dimension[2];
                  x2 := Dimension[3];
                  y2 := Dimension[4];
                 END;

     CLOSE(f);


      sx := x;
      sy := y;


 DateiInit(FileName);

  SEEK(f,0);

   READ(f, field);

    CLOSE(f);




   REPEAT;

    WITH field DO BEGIN;
                   PixStr := Buffer[Zaehler];
                  END;

     i := 1;

    REPEAT;



     CurrPix := COPY(PixStr,i,1);

          IF CurrPix = '0' THEN PUTPIXEL (x,y,0);
           IF CurrPix = '1' THEN PUTPIXEL (x,y,1);
            IF CurrPix = '2' THEN PUTPIXEL (x,y,2);
             IF CurrPix = '3' THEN PUTPIXEL (x,y,3);
              IF CurrPix = '4' THEN PUTPIXEL (x,y,4);
               IF CurrPix = '5' THEN PUTPIXEL (x,y,5);
                IF CurrPix = '6' THEN PUTPIXEL (x,y,6);
                 IF CurrPix = '7' THEN PUTPIXEL (x,y,7);
                  IF CurrPix = '8' THEN PUTPIXEL (x,y,8);
                   IF CurrPix = '9' THEN PUTPIXEL (x,y,9);
                    IF CurrPix = 'A' THEN PUTPIXEL (x,y,10);
                     IF CurrPix = 'B' THEN PUTPIXEL (x,y,11);
                      IF CurrPix = 'C' THEN PUTPIXEL (x,y,12);
                       IF CurrPix = 'D' THEN PUTPIXEL (x,y,13);
                        IF CurrPix = 'E' THEN PUTPIXEL (x,y,14);
                         IF CurrPix = 'F' THEN PUTPIXEL (x,y,15);


      x := x +1;
      i := i +1;

     UNTIL x = ((x2+1) -x1) + sx;

       x := sx;
       y := y +1;
       Zaehler := Zaehler +1;
       PixStr  := '';

    UNTIL y = ((y2+1) -y1) + sy;

     HALT;


END;











BEGIN

 SetInGraphMode('');
 LoadPic(ParamStr(1), 0, 0);

END.
PROGRAM BackDoors_FLI_Viewer;

USES Graph, Crt, Bmp16;

VAR p1,p2,p3,p4,p5  : Pointer;
    p6,p7,p8,p9,p10 : Pointer;
    p11,p12,p13,p14 : Pointer;

    Directory       : String;
    PicAnz          : String;
    BreakKey        : String;

    CurrPic         : String;



{$M 55535,0,655360}



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

END;




PROCEDURE Initialisierung;

BEGIN

 Directory := ParamStr (1);
 PicAnz    := ParamStr (2);
 BreakKey  := ParamStr (4);

  SetInGraphMode (ParamStr(3));

END;




PROCEDURE Speichere_Pics;

BEGIN


    CurrPic := Directory + '\01.bmp';
  GET_BITMAPSCALE(CurrPic);
   PUTBMP(0, Bitmap_Heigth -1, CurrPic);
    GETMEM (p1, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p1^);

   IF PicAnz = '1' THEN EXIT;

    CurrPic := Directory + '\02.bmp';
  GET_BITMAPSCALE(CurrPic);
   PUTBMP(0, Bitmap_Heigth -1, CurrPic);
    GETMEM (p2, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p2^);

   IF PicAnz = '2' THEN EXIT;

    CurrPic := Directory + '\03.bmp';
  GET_BITMAPSCALE(CurrPic);
   PUTBMP(0, Bitmap_Heigth -1, CurrPic);
    GETMEM (p3, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p3^);

   IF PicAnz = '3' THEN EXIT;

    CurrPic := Directory + '\04.bmp';
  GET_BITMAPSCALE(CurrPic);
   PUTBMP(0, Bitmap_Heigth -1, CurrPic);
    GETMEM (p4, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p4^);

   IF PicAnz = '4' THEN EXIT;

    CurrPic := Directory + '\05.bmp';
  GET_BITMAPSCALE(CurrPic);
   PUTBMP(0, Bitmap_Heigth -1, CurrPic);
    GETMEM (p5, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p5^);

   IF PicAnz = '5' THEN EXIT;

    CurrPic := Directory + '\06.bmp';
  GET_BITMAPSCALE(CurrPic);
   PUTBMP(0, Bitmap_Heigth -1, CurrPic);
    GETMEM (p6, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p6^);

   IF PicAnz = '6' THEN EXIT;

    CurrPic := Directory + '\07.bmp';
  GET_BITMAPSCALE(CurrPic);
   PUTBMP(0, Bitmap_Heigth -1, CurrPic);
    GETMEM (p7, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p7^);

   IF PicAnz = '7' THEN EXIT;

    CurrPic := Directory + '\08.bmp';
  GET_BITMAPSCALE(CurrPic);
   PUTBMP(0, Bitmap_Heigth -1, CurrPic);
    GETMEM (p8, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p8^);

   IF PicAnz = '8' THEN EXIT;

    CurrPic := Directory + '\09.bmp';
  GET_BITMAPSCALE(CurrPic);
   PUTBMP(0, Bitmap_Heigth -1, CurrPic);
    GETMEM (p9, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p9^);

   IF PicAnz = '9' THEN EXIT;

    CurrPic := Directory + '\10.bmp';
  GET_BITMAPSCALE(CurrPic);
   PUTBMP(0, Bitmap_Heigth -1, CurrPic);
    GETMEM (p10, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p10^);

   IF PicAnz = '10' THEN EXIT;

    CurrPic := Directory + '\11.bmp';
  GET_BITMAPSCALE(CurrPic);
   PUTBMP(0, Bitmap_Heigth -1, CurrPic);
    GETMEM (p11, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p11^);

   IF PicAnz = '11' THEN EXIT;

    CurrPic := Directory + '\12.bmp';
  GET_BITMAPSCALE(CurrPic);
   PUTBMP(0, Bitmap_Heigth -1, CurrPic);
    GETMEM (p12, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p12^);

   IF PicAnz = '12' THEN EXIT;

    CurrPic := Directory + '\13.bmp';
  GET_BITMAPSCALE(CurrPic);
   PUTBMP(0, Bitmap_Heigth -1, CurrPic);
    GETMEM (p13, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p13^);

   IF PicAnz = '13' THEN EXIT;

    CurrPic := Directory + '\14.bmp';
  GET_BITMAPSCALE(CurrPic);
   PUTBMP(0, Bitmap_Heigth -1, CurrPic);
    GETMEM (p14, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p14^);

END;





PROCEDURE Zeige_Pics;

VAR X,Y : Integer;

BEGIN;

  GET_BITMAPSCALE (CurrPic);
   X := (GetMaxX div 2) - (Bitmap_Width div 2);
   Y := (GetMaxY div 2) - (Bitmap_Heigth div 2);

 PUTIMAGE(X, Y,p1^,NormalPut);
     IF PicAnz = '12' THEN EXIT;
 PUTIMAGE(X, Y,p2^,NormalPut);
     IF PicAnz = '2' THEN EXIT;
 PUTIMAGE(X, Y,p3^,NormalPut);
     IF PicAnz = '3' THEN EXIT;
 PUTIMAGE(X, Y,p4^,NormalPut);
     IF PicAnz = '4' THEN EXIT;
 PUTIMAGE(X, Y,p5^,NormalPut);
     IF PicAnz = '5' THEN EXIT;
 PUTIMAGE(X, Y,p6^,NormalPut);
     IF PicAnz = '6' THEN EXIT;
 PUTIMAGE(X, Y,p7^,NormalPut);
     IF PicAnz = '7' THEN EXIT;
 PUTIMAGE(X, Y,p8^,NormalPut);
     IF PicAnz = '8' THEN EXIT;
 PUTIMAGE(X, Y,p9^,NormalPut);
     IF PicAnz = '9' THEN EXIT;
 PUTIMAGE(X, Y,p10^,NormalPut);
     IF PicAnz = '10' THEN EXIT;
 PUTIMAGE(X, Y,p11^,NormalPut);
     IF PicAnz = '11' THEN EXIT;
 PUTIMAGE(X, Y,p12^,NormalPut);
     IF PicAnz = '12' THEN EXIT;
 PUTIMAGE(X, Y,p13^,NormalPut);
     IF PicAnz = '13' THEN EXIT;
 PUTIMAGE(X, Y,p14^,NormalPut);

END;



BEGIN

   Initialisierung;
     Speichere_Pics;
      
       SETVIEWPORT(0,0,GetMaxX,GetMaxY,TRUE);
        CLEARVIEWPORT;

           REPEAT

            REPEAT
             Zeige_Pics
            UNTIL KEYPRESSED;

           UNTIL READKEY = BreakKey;


    CloseGraph;
     CLRSCR;

    TEXTCOLOR (11);
    WRITELN ('Thanx for using BackDoor`s FLI - Viewer V1.2');
     TEXTCOLOR (3);
     WRITELN ('(c)1995 BackDoor ÄÄ Coded by Captain Olliwood');

      NormVideo;


END.
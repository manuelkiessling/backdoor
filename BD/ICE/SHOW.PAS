PROGRAM Show_Movie;

USES Graph, Crt, Bmp16;

VAR p1,p2,p3,p4,p5  : Pointer;
    p6,p7,p8,p9,p10 : Pointer;
    p11,p12,p13,p14 : Pointer;
    p15,p16,p17,p18 : Pointer;
    p19,p20,p21,p22 : Pointer;  
    p23,p24,p25,p26 : Pointer;
    p27,p28,p29,p30 : Pointer;
    p31,p32,p33     : Pointer;


PROCEDURE SetInGraphMode;

 VAR grDrv, grMd, OccErr : Integer;


 BEGIN
   grDrv := Detect;

  InitGraph (grDrv, grMd, '');

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





PROCEDURE Speichere_Pics;

BEGIN

  GET_BITMAPSCALE('\ice\pics\01.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\01.bmp');
    GETMEM (p1, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p1^);

  GET_BITMAPSCALE('\ice\pics\02.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\02.bmp');
    GETMEM (p2, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p2^);

  GET_BITMAPSCALE('\ice\pics\03.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\03.bmp');
    GETMEM (p3, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p3^);

  GET_BITMAPSCALE('\ice\pics\04.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\04.bmp');
    GETMEM (p4, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p4^);

  GET_BITMAPSCALE('\ice\pics\05.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\05.bmp');
    GETMEM (p5, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p5^);

  GET_BITMAPSCALE('\ice\pics\06.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\06.bmp');
    GETMEM (p6, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p6^);

  GET_BITMAPSCALE('\ice\pics\07.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\07.bmp');
    GETMEM (p7, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p7^);

  GET_BITMAPSCALE('\ice\pics\08.bmp');
   PUTBMP(0, Bitmap_Heigth -1,'\ice\pics\08.bmp');
    GETMEM (p8, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p8^);

  GET_BITMAPSCALE('\ice\pics\09.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\09.bmp');
    GETMEM (p9, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p9^);

  GET_BITMAPSCALE('\ice\pics\10.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\10.bmp');
    GETMEM (p10, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p10^);

  GET_BITMAPSCALE('\ice\pics\11.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\11.bmp');
    GETMEM (p11, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p11^);

  GET_BITMAPSCALE('\ice\pics\12.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\12.bmp');
    GETMEM (p12, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p12^);

  GET_BITMAPSCALE('\ice\pics\13.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\13.bmp');
    GETMEM (p13, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p13^);

  GET_BITMAPSCALE('\ice\pics\14.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\14.bmp');
    GETMEM (p14, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p14^);

  GET_BITMAPSCALE('\ice\pics\15.bmp');
   PUTBMP(0, Bitmap_Heigth -1,'\ice\pics\15.bmp');
    GETMEM (p15, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p15^);

  GET_BITMAPSCALE('\ice\pics\16.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\16.bmp');
    GETMEM (p16, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p16^);

  GET_BITMAPSCALE('\ice\pics\17.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\17.bmp');
    GETMEM (p17, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p17^);

  GET_BITMAPSCALE('\ice\pics\18.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\18.bmp');
    GETMEM (p18, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p18^);

  GET_BITMAPSCALE('\ice\pics\19.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\19.bmp');
    GETMEM (p19, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p19^);

  GET_BITMAPSCALE('\ice\pics\20.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\20.bmp');
    GETMEM (p20, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p20^);

  GET_BITMAPSCALE('\ice\pics\21.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\21.bmp');
    GETMEM (p21, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p21^);

  GET_BITMAPSCALE('\ice\pics\22.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\22.bmp');
    GETMEM (p22, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p22^);

  GET_BITMAPSCALE('\ice\pics\23.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\23.bmp');
    GETMEM (p23, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p23^);

  GET_BITMAPSCALE('\ice\pics\24.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\24.bmp');
    GETMEM (p24, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p24^);

  GET_BITMAPSCALE('\ice\pics\25.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\25.bmp');
    GETMEM (p25, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p25^);

  GET_BITMAPSCALE('\ice\pics\26.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\26.bmp');
    GETMEM (p26, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p26^);

  GET_BITMAPSCALE('\ice\pics\27.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\27.bmp');
    GETMEM (p27, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p27^);

  GET_BITMAPSCALE('\ice\pics\28.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\28.bmp');
    GETMEM (p28, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p28^);

  GET_BITMAPSCALE('\ice\pics\29.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\29.bmp');
    GETMEM (p29, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p29^);

  GET_BITMAPSCALE('\ice\pics\30.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\30.bmp');
    GETMEM (p30, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p30^);

  GET_BITMAPSCALE('\ice\pics\31.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\31.bmp');
    GETMEM (p31, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p31^);

  GET_BITMAPSCALE('\ice\pics\32.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\32.bmp');
    GETMEM (p32, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p32^);

  GET_BITMAPSCALE('\ice\pics\33.bmp');
   PUTBMP(0, Bitmap_Heigth -1, '\ice\pics\33.bmp');
    GETMEM (p33, IMAGESIZE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1));
     GETIMAGE(0, 0, Bitmap_Width -1, Bitmap_Heigth -1, p33^);

END;




PROCEDURE Zeige_Pics;

BEGIN;

 PUTIMAGE(200,200,p1^,NormalPut);
 PUTIMAGE(200,200,p2^,NormalPut);
 PUTIMAGE(200,200,p3^,NormalPut);
 PUTIMAGE(200,200,p4^,NormalPut);
 PUTIMAGE(200,200,p5^,NormalPut);
 PUTIMAGE(200,200,p6^,NormalPut);
 PUTIMAGE(200,200,p7^,NormalPut);
 PUTIMAGE(200,200,p8^,NormalPut);
 PUTIMAGE(200,200,p9^,NormalPut);
 PUTIMAGE(200,200,p10^,NormalPut);
 PUTIMAGE(200,200,p11^,NormalPut);
 PUTIMAGE(200,200,p12^,NormalPut);
 PUTIMAGE(200,200,p13^,NormalPut);
 PUTIMAGE(200,200,p14^,NormalPut);
 PUTIMAGE(200,200,p15^,NormalPut);
 PUTIMAGE(200,200,p16^,NormalPut);
 PUTIMAGE(200,200,p17^,NormalPut);
 PUTIMAGE(200,200,p18^,NormalPut);
 PUTIMAGE(200,200,p19^,NormalPut);
 PUTIMAGE(200,200,p20^,NormalPut);
 PUTIMAGE(200,200,p21^,NormalPut);
 PUTIMAGE(200,200,p22^,NormalPut);
 PUTIMAGE(200,200,p23^,NormalPut);
 PUTIMAGE(200,200,p24^,NormalPut);
 PUTIMAGE(200,200,p25^,NormalPut);
 PUTIMAGE(200,200,p26^,NormalPut);
 PUTIMAGE(200,200,p27^,NormalPut);
 PUTIMAGE(200,200,p28^,NormalPut);
 PUTIMAGE(200,200,p29^,NormalPut);
 PUTIMAGE(200,200,p30^,NormalPut);
 PUTIMAGE(200,200,p31^,NormalPut);
 PUTIMAGE(200,200,p32^,NormalPut);
 PUTIMAGE(200,200,p33^,NormalPut);

END;



BEGIN

 SetInGraphMode;

  Speichere_Pics;

  REPEAT Zeige_Pics UNTIL KEYPRESSED;

END.
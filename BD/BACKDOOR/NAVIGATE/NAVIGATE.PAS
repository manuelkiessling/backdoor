(* BackDoors Navigate (NAVIGATE.EXE) to run progs from a Graph screen *)
(* from 18/6/1995  by BackDoor *)



PROGRAM Ereignisabfrage_bei_Bewegung;

USES Dos, Graph, Crt, BMP16;

VAR Position : Integer;

    Taste : Char;

    VGADir : String;

    p1,p2,p3,p4,p5,p6,p7,p8,p9,p10 : Pointer;


                 



{$M $400,0,270000 }



      



PROCEDURE Speichere_Pics(Directory, PicAnz : String);

VAR CurrPic : String;

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

END;






PROCEDURE Show_PosPic;

BEGIN;

  IF Position =  1 THEN PUTIMAGE (320 - (Bitmap_Width div 2), 240 - (Bitmap_Heigth div 2),  p1^, NormalPut);
  IF Position =  2 THEN PUTIMAGE (320 - (Bitmap_Width div 2), 240 - (Bitmap_Heigth div 2),  p2^, NormalPut);
  IF Position =  3 THEN PUTIMAGE (320 - (Bitmap_Width div 2), 240 - (Bitmap_Heigth div 2),  p3^, NormalPut);
  IF Position =  4 THEN PUTIMAGE (320 - (Bitmap_Width div 2), 240 - (Bitmap_Heigth div 2),  p4^, NormalPut);
  IF Position =  5 THEN PUTIMAGE (320 - (Bitmap_Width div 2), 240 - (Bitmap_Heigth div 2),  p5^, NormalPut);
  IF Position =  6 THEN PUTIMAGE (320 - (Bitmap_Width div 2), 240 - (Bitmap_Heigth div 2),  p6^, NormalPut);
  IF Position =  7 THEN PUTIMAGE (320 - (Bitmap_Width div 2), 240 - (Bitmap_Heigth div 2),  p7^, NormalPut);
  IF Position =  8 THEN PUTIMAGE (320 - (Bitmap_Width div 2), 240 - (Bitmap_Heigth div 2),  p8^, NormalPut);
  IF Position =  9 THEN PUTIMAGE (320 - (Bitmap_Width div 2), 240 - (Bitmap_Heigth div 2),  p9^, NormalPut);
  IF Position = 10 THEN PUTIMAGE (320 - (Bitmap_Width div 2), 240 - (Bitmap_Heigth div 2), p10^, NormalPut);

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







PROCEDURE Init_All;

VAR PICDir : String;

BEGIN

 CLRSCR;

  TEXTCOLOR(11);
   WRITELN('BackDoors NAVIGATE V1.1 (tm)');
  TEXTCOLOR(1);
   WRITELN('Readymade on 6-6-1995 by Captain Olliwood');
  TEXTCOLOR(15);
   WRITELN('컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴');
   WRITELN;

  TEXTCOLOR(3);
   WRITE('Geben Sie den Pfad zum Bilder-Quellverzeichnis ein: ');
    TEXTCOLOR(7);
     READLN(PICDir);

   WRITELN;

  TEXTCOLOR(3);
   WRITE('Geben Sie den Pfad zur `EGAVGA.BGI` Datei ein: ');
    TEXTCOLOR(7);
     READLN(VGADir);




  SetInGraphMode (VGADir);
   Position := 1;
    Speichere_Pics(PICDir, '5');



  SETVIEWPORT (0,0,GetMaxX,GetMaxY,TRUE);
   CLEARVIEWPORT;


END;




PROCEDURE HeadLine;

BEGIN

   SETTEXTSTYLE (GothicFont, HorizDir, 5);

    SETCOLOR(3);
     OUTTEXTXY(319 - (TEXTWIDTH('BackDoors NAVIGATE(tm)') div 2), 49, 'BackDoors NAVIGATE(tm)');
    SETCOLOR(11);
     OUTTEXTXY(320 - (TEXTWIDTH('BackDoors NAVIGATE(tm)') div 2), 50, 'BackDoors NAVIGATE(tm)');

END;







PROCEDURE The_End;

BEGIN;

 CLOSEGRAPH;
  CLRSCR;

 TEXTCOLOR(3);
  WRITE('Thanx for using ');
 TEXTCOLOR(11);
  WRITELN('BackDoors NAVIGATE(tm)');
 TEXTCOLOR(15);
  WRITELN('컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴');
 TEXTCOLOR(1);
  WRITELN('From June 1995, mainprogging by C/O');

   WRITELN;
    NORMVIDEO;

   HALT;

END;







PROCEDURE LoadProg;

VAR ProgToLoad: String;

BEGIN;

  CLOSEGRAPH;
  NORMVIDEO;


 IF Position =  1 THEN ProgToLoad := 'C:\DOS\EDIT.COM';
 IF Position =  2 THEN ProgToLoad := 'C:\BACKDOOR\FILEWORK\FILEWORK.EXE';
 IF Position =  3 THEN ProgToLoad := 'C:\NC\BITMAP.EXE C:\BACKDOOR\BD-ARTS\BDART1.PCX';
 IF Position =  4 THEN ProgToLoad := 'C:\DOS\QBASIC.EXE';
 IF Position =  5 THEN ProgToLoad := 'C:\NC\NC.COM';
 

   SWAPVECTORS;
  EXEC(ProgToLoad, '');
   SWAPVECTORS;


   SetInGraphMode(VGADir);
    HeadLine;

END;





PROCEDURE What_Now;

BEGIN

   IF Taste = '8' THEN
    BEGIN

     Position := Position + 1;
     IF Position > 5 THEN Position := 5;

    END;



   IF Taste = '2' THEN
    BEGIN

     Position := Position - 1;
     IF Position < 1 THEN Position := 1;

    END;


   IF Taste = 'q' THEN The_End;

   IF Taste = 'l' THEN LoadProg;

END;






PROCEDURE Wait_Input;

BEGIN

 REPEAT
      Taste := READKEY;
 UNTIL Taste <> '';

  What_Now;

END;




BEGIN

   Init_All;
   HeadLine;

 REPEAT

  Show_PosPic;
  Wait_Input;

 UNTIL 1 = 2;

END.
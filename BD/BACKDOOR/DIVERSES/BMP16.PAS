unit bmp16;
{ Turbopascal 6.0 - unit zum Laden von 16-color-Bitmaps )


{  Programmiert und freigegeben von :

   Ralf Fischer, Gerresheimerstr. 146  40233 Dsseldorf

Fr weitere Informationen wenden Sie sich an

GYtROnics    Ralf Fischer, Hard + Softwareentwicklung

selbe Adresse, oder PM an user RDB in der Mailbox des NCC Neuss
02131 - 222072

}


interface

uses dos,crt,graph;

{ Puffer 64 k fr die Bilddaten, Pointer }
type kopierbuffer = array[1..$FFFF] of byte;

var bitmap_width,bitmap_heigth:longint;

COPBUF:^kopierbuffer;   { Puffer 64 k fr Kopiervorgnge POINTER !!  }


{========= x/y - Grsse der Bitmap ermitteln ====================}
procedure get_bitmapscale(mapfile:string);

{========= Bitmap auf Koordinaten x,y einlesen ==================}
procedure putbmp(x,y:integer; bmpfile:string);


implementation

{-------- Farbentabelle BMP-->Pascal  ---------------------------}
const pal:array[0..$F] of integer =
              ((0),
               (4),
               (2),
               (6),
               (1),
               (5),
               (3),
               (8),
               (7),
               (12),
               (10),
               (14),
               (9),
               (13),
               (11),
               (15));

var
bmpx,bmpy:longint;           { Bitmap Breite,hhe }



{ Get_Bitmapscale dient dazu, VOR laden einer *.BMP deren Grsse
  zu ermitteln. Braucht man z.B. um vorher abzuprfen, ob die Grafik
  an den beabsichtigten Koordinaten berhaupt passt.
}

procedure get_bitmapscale(mapfile:string);

var bf:file;
    br:integer;

begin
  assign(bf,mapfile);
  reset(bf,1);
  blockread(bf,copbuf^,118,br);
  move(copbuf^[19],bitmap_width,4);
  move(copbuf^[23],bitmap_heigth,4);
  close(bf);
end;


procedure putbmp(x,y:integer; bmpfile:string);

var bf:file;
    i,j,k,l,cx,cy:longint;
    br:word;
    b:array[1..4] of byte;
    vollb,rest:integer;
    lsn,msn:byte;
    halfbyte:boolean;
    ltoread:longint;
    { Anzahl der Zeilen, die auf einen Rutsch innen copbuf^ passen }
    lread:longint;
    { Anzahl der tatschlich gelesenen Zeilen }
    btoread:longint;
    

begin
  
  assign(bf,bmpfile);
  reset(bf,1);
  halfbyte:=false;
  { kompletten Header lesen, nur breite/hhe sind interessant }
  blockread(bf,copbuf^,118,br);
  move(copbuf^[19],bmpx,4);
  move(copbuf^[23],bmpy,4);
  bitmap_width:=bmpx;
  bitmap_heigth:=bmpy;
  vollb:=trunc(bmpx/2);  { anzahl voller Bytes }
  rest:=trunc(((bmpx/2)-vollb)*2); { rest? entweder 0 oder 0.5 , mal 2 = 0 oder
 1}
  if rest>0 then halfbyte:=true;
  vollb:=vollb+rest;     { volle Bytes die Daten enthalten }
  rest:=trunc(((vollb/4)-trunc(vollb/4))*4);
  if rest>0 then
  rest:=4-rest;

  ltoread:=trunc($FFF0 div (vollb+rest));
  {== hauptschleife zeilen von unten nach oben ===}

  cy:=y;  { Zeilenzhler }
 repeat
   {== Block einlesen ==}
   blockread(bf,copbuf^,(ltoread*(vollb+rest)),br);
   lread:=trunc(br div (vollb+rest));

   k:=0; 
    for l:=1 to lread do
     begin
      cx:=x;

      for j:=1 to vollb do
        begin

         lsn:=copbuf^[k+j];
         msn:=lsn AND $F0;
         lsn:=lsn AND $0F;
         msn:=msn shr 4;  
         putpixel(cx,cy,pal[msn]);
         inc(cx);
         if j<>vollb then
         putpixel(cx,cy,pal[lsn]);
         if (j=vollb) and not halfbyte then
            putpixel(cx,cy,pal[lsn]);
         inc(cx);
        end;
        dec(cy);        { Nchste Zeile }

      k:=k+vollb+rest;  { Zeiger innerhalb des copbuf eine Zeile weiter }
     end;

 until eof(bf);
close(bf);
end;


{ Initialisierung der unit }

begin
  new(COPBUF);       { Pointer Kopierbuffer initialisieren (erzeugen) }
end.        {#######################   ENDE DER UNIT  ####################}
{ This, Folks, is the 2nd BackDoor program. Enjoy it, it's made for you! }
{ Idea + Coding: C. Olliwood. Distortions by Chip-sy-King (Hahaha!) }
(* by BackDoor. 18/6/1995 *)


PROGRAM Funny_Message_V1_0; { From Feb. the 26, 1995 }

USES Crt;

VAR Zuffi_Zahl : Integer;
        Spruch : String;



PROCEDURE Waehle_Spruch;

 BEGIN
   Zuffi_Zahl := RANDOM (9);

    CASE Zuffi_Zahl OF

     0 : Spruch := 'Hi, nice to see you. Hope you got a good f*#+ tonight !?';
     1 : Spruch := 'Yes, touch my keys, you stut muffin. It is so good when you do it!';
     2 : Spruch := 'No joke today, I`m busy!';
     3 : Spruch := 'Hi, chummer, doin` alright? I hope so! Now let`s start...';
     4 : Spruch := 'Eat shit and bark at the moon! (No offence)';
     5 : Spruch := 'WARNING!!! There is a corrupt DOS-System on your HD. Your PC will explode in 20 seconds!';
     6 : Spruch := 'Ya know BackDoors motto? GOTTA GET AWAY !!!';
     7 : Spruch := 'The last words of an electrician: `What`s that cable?`';
     8 : Spruch := '`RAM` : Righteous American Motherfucker. How much have YOU?'
    END;
 END;



BEGIN

  Spruch  := '';

 RANDOMIZE;

  WRITELN;

   TextAttr := RANDOM (16);
   Waehle_Spruch;
   WRITELN (Spruch);

    TEXTCOLOR (7);
    WRITELN ('The ultimate Joke-Processor. (c)1995 by BackDoor');
    WRITELN;

   NORMVIDEO;

END.

{ That`s all again. Go home scrawnking zour chick! }
{ This, Folks, is the 2nd BackDoor program. Enjoy it, it's made for you! }
{ Idea: C. Olliwood. Distortions by Chip-sy-King (Hahaha!) }

PROGRAM Funny_Message_V1_0; { From Feb. the 26, 1995 }

USES Crt;

VAR Zuffi_Zahl : Integer;
        Spruch : String;



PROCEDURE Waehle_Spruch;

 BEGIN
    Zuffi_Zahl := RANDOM (6);

    CASE Zuffi_Zahl OF

     0 : Spruch := 'Hi, nice to see you. Hope you got a good f*#+ tonight !?';
     1 : Spruch := 'Yes, touch my keys, you stut muffin. It is so good when you do it!';
     2 : Spruch := 'No joke today, I`m busy!';
     3 : Spruch := 'Hi, chummer, doin` alright? I hope so! Now let`s start...';
     4 : Spruch := 'Eat shit and bark at the moon! (No offence)';
     5 : Spruch := 'WARNING!!! There is a corrupt DOS-System on your HD. Your PC will explode in 20 seconds!';

    END;
 END;



BEGIN

 RANDOMIZE;

  WRITELN;

   TextAttr := RANDOM (16);
   Waehle_Spruch;
   WRITELN (Spruch);

    TEXTCOLOR (8);
    WRITELN ('The ultimate Joke-Processor. (c)1995 by BackDoor');

  WRITELN;

 TEXTCOLOR (7);

END.
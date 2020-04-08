with Ada.Float_Text_IO;
procedure Newton is
   A : Float;
   X : Float;
   Diff: constant Float := 0.01;
   Previous_X : Float := 0.0;
begin
   Ada.Float_Text_IO.Get( A );
   X := A / 2.0;

--     while abs (X-Previous_X) >= Diff loop
--       Previous_X:= X;
--       X := 0.5 * (X + A/X);
--     end loop;

loop
     Previous_X := X;
     X := 0.5 * (X + A/X);
     exit when abs (X-Previous_X) < Diff;
end loop;

   Ada.Float_Text_IO.Put( X );
end Newton;

with Ada.Float_Text_IO;
procedure Pi is
   Prod : Float := 1.0;
   k : Float := 0.0;
begin
   for I in 1..20000 loop
      k := k + 2.0;
      Prod := Prod * (k / (k-1.0)) * (k / (k+1.0));
   end loop;
   Ada.Float_Text_IO.Put( 2.0 * Prod );
end Pi;

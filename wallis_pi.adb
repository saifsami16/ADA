with Ada.Text_IO;
use Ada.Text_IO;

procedure Wallis_pi is
   pi:Float := 2.0;
   i:Integer := 2;
begin

   while i < 100000 loop
      pi := pi * (Float(i)/Float(i-1));
      pi := pi * (Float(i)/Float(i+1));
      i := i+2;
   end loop;
   Put_Line(FLoat'Image(pi));
end Wallis_pi;

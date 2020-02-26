with Ada.Text_IO;
use Ada.Text_IO;

procedure Euler_number is
   N:Integer;
   Euler:Float := 1;
   temp:Float := 1;
begin
   Put_Line("Please enter the number of terms desired: ");
   N := Integer'Value(Get_Line);
   for i = 1..N loop
      temp := temp * float(i);
      Euler := Euler + (1.0/float(temp));
   end loop;
   Put_Line();
   Put_Line(Float'Image(Euler));
end Euler_number;

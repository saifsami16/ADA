with Ada.Text_IO;
use Ada.Text_IO;

procedure Loop_Accumulate is
   s:Integer := 0;
   N:Integer;
begin
   --get(s);
   Put_Line("Please enter value for N: ");
   N := Integer'Value(Get_Line);
   --Put_Line("The value of N is ");
   --Put_Line(Integer'Image(N));
   for i in 1..N loop
      s:=s+i;
   end loop;
   Put_Line(Integer'Image(s));
end Loop_Accumulate;

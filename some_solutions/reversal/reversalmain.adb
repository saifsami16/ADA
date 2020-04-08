with reversal, Ada.Text_IO;
use Ada.Text_IO;
procedure reversalmain is

   type T1 is array (Integer range <>) of Integer;

   procedure myreversal is new reversal(Integer, Integer, T1);

   a: T1(10..15):=(1,2,3,4,5,6);
   a1: T1(10..16):=(1,2,3,4,5,6,7);
   a2: T1:=(1,2);
   a3: T1(1..1);
   a4: T1(1..0);
begin
   New_Line;
   myreversal(a);
   for i in a'range loop
      Put_Line(Integer'Image(a(i)));
   end loop;
   New_Line;
   myreversal(a1);
   for i in a1'range loop
      Put_Line(Integer'Image(a1(i)));
   end loop;
   New_Line;
   myreversal(a2);
   for i in a2'range loop
      Put_Line(Integer'Image(a2(i)));
   end loop;
   New_Line;
   a3(1):=10;
   myreversal(a3);
   for i in a3'range loop
      Put_Line(Integer'Image(a3(i)));
   end loop;
   New_Line;
   myreversal(a4);
   for i in a4'range loop
      Put_Line(Integer'Image(a4(i)));
   end loop;
end reversalmain;

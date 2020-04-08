with map, Ada.Text_IO;
use Ada.Text_IO;
procedure main is

    type Index is new Integer;

    type TInt is array (Index range <>) of Integer;
   type TFloat is array (Index range <>) of Float;

    function myop (x: Integer) return Float is
    begin
      return (Float(x)/2.0);
   end myop;

    a: TInt(1..5):=(1,2,3,4,5);
    b: TFloat(a'range);

    function Mymap is new map (Integer, Float, Index, TInt, TFloat, myop);
begin

   b:= Mymap(a);
   for i in b'range loop
      Put_line(Float'Image(b(i)));
      end loop;
end main;

with double2, Ada.Text_IO;
use Ada.Text_IO;
procedure doublemain2 is

   type T1 is array (Integer range <>) of Integer;

   --procedure mydouble is new double2(Integer, Integer, T1,"=");
   procedure mydouble is new double2(Integer, Integer, T1);

   a: T1(10..15):=(1,2,3,4,5,6);
   a1: T1:=(1,2,3,4,5,2,7,2,3);

   b: Boolean;
   x,y:Integer;
begin
   New_Line;
   mydouble(a,b,x,y);
   if b then Put_Line(Integer'Image(a(x)) & " " & Integer'Image(a(y)));
      else Put_Line("no doubles");
   end if;
   mydouble(a1,b,x,y);
   if b then Put_Line(Integer'Image(a1(x)) & " " & Integer'Image(a1(y)));
      else Put_Line("no doubles");
   end if;
end doublemain2;

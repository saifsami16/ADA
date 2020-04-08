with Maximum, Ada.Text_IO;
use Ada.Text_IO;
procedure Max_Demo is
function I_Max is new Maximum( Integer, "<" );
function I_Min is new Maximum( Integer, ">" );
--function F_Max is new Maximum( Float );

begin

   Put_line(Integer'Image(I_max(3, 28)));
   Put_line(Integer'Image(I_min(3, 28)));
-- Put_line(Float'Image(F_Max(3.0, 28.0)));
end Max_Demo;

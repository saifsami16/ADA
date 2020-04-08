with Get_Discreet, Text_IO; use Text_IO;
procedure Demo is
   function Get_Int is new Get_Discreet(Integer);
begin
   Put_Line( Integer'Image(Get_Int) );
end Demo;

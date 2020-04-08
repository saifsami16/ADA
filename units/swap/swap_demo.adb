with Ada.Integer_Text_IO, Ada.Text_IO;
use Ada.Integer_Text_IO;
with swap, swap_other;
procedure swap_demo is
   A, B : Integer;
begin
   Get( A );
   Get( B );
   swap( A, B );
   Put( A ); Put( B );
   Ada.Text_IO.New_Line;
   swap_other( A, B );
   Put( A ); Put( B );
end swap_demo;

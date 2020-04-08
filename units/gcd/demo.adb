with Ada.Integer_Text_IO, Ada.Text_IO;
use Ada.Integer_Text_IO;
with gcd, eucl, factorial;
procedure demo is
   A, B, C, D: Positive;
begin
   Get( A );
   Get( B );
   Put( gcd(A,B) );
   eucl(A,B, C, D);
   Ada.Text_IO.New_Line;
   Put( C );
   Ada.Text_IO.New_Line;
   Put (D);
   Ada.Text_IO.New_Line;
   Put( factorial(A) );
end demo;

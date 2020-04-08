with Ada.Integer_Text_IO, Ada.Text_IO; 
use Ada.Integer_Text_IO;
with Math; -- use Mat;
procedure main is
   A, B : Positive;
begin
   Get( A );
   Get( B );
   Put( Math.gcd(A,B) );
   Ada.Text_IO.New_Line; 
   Put( Math.factorial(A) ); 
end main;

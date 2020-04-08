with Ada.Integer_Text_IO, Ada.Text_IO, Ada.Float_Text_IO; 
use Ada.Integer_Text_IO, Ada.Float_Text_IO;
with Math; use Math;
procedure main is
   --A: Positive;
  A : Float;
begin
   Get( A );
  -- Get( B );
  -- Put( Math.gcd(A,B) );
   Ada.Text_IO.New_Line; 
  -- Put( Math.factorial(A) ); 
  -- Put( Math.adddigits(A) );
  --Ada.Text_IO.Put( Boolean'Image(check9(A) ));
  --perfect;
  Put(sinx(A));
end main;

with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with gcd_rec, eucl_rec, fact_rec;
procedure demo_gcd_rec is
   A, B : Positive;
begin
   Get( A );
   Get( B );
   Put( gcd_rec(A,B) );
   Put( eucl_rec(A,B) );
   Put( fact_rec(A));
end demo_gcd_rec;

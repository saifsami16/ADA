with Ada.Integer_Text_IO;
procedure Gcd is
   A, B : Positive;
begin
   Ada.Integer_Text_IO.Get( A );   -- Constraint_Error!
   Ada.Integer_Text_IO.Get( B );
   while A /= B loop
      if A > B then
         A := A - B;
      else
         B := B - A;
      end if;
   end loop;
   Ada.Integer_Text_IO.Put( A );
end Gcd;

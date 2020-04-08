function gcd_rec ( A, B : Positive ) return Positive is
begin
   if A > B then return gcd_rec(A-B,B);
   elsif A < B then return gcd_rec(A,B-A);
   else return A;
   end if;
end gcd_rec;
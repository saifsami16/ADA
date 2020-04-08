function Fibonacci ( N: Positive ) return Positive is
   A, B: Positive := 1;
   Tmp: Positive;
begin
   for I in 3..N loop
      Tmp := A+B;
      B := A;
      A := Tmp;
   end loop;
   return A;
end Fibonacci;

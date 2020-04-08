function gcd ( A, B : Positive ) return Positive is
   X: Positive := A;
   Y: Natural := B;
   Tmp: Natural;
begin
   while Y /= 0 loop
      Tmp := X mod Y;
      X := Y;
      Y := Tmp;
   end loop;
   return X;
end gcd;

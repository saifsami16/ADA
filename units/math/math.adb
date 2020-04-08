package body Math is

   function gcd ( A, B : Positive ) return Positive is
      X: Positive := A;
      Y: Positive := B;
   begin
      while X /= Y loop
         if X > Y then
            X := X - Y;
         else
            Y := Y - X;
         end if;
      end loop;
      return X;
   end gcd;

   function factorial( N: Natural ) return Positive is
      Fakt : Positive := 1;
   begin
      for I in 1..N loop
         Fakt := Fakt * I;
      end loop;
      return Fakt;
   end factorial;

end Math;
   

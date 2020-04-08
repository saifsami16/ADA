with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
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
   
   function adddigits(n: Positive) return natural is
      x: Natural := n;
      s: Natural := 0;
   begin
      while x > 0 loop
         s := s + (x mod 10);
         x := x /10;
      end loop;
      return s;
   end adddigits;
   
   function check9 (n: Natural) return Boolean is
   begin
      if (adddigits(n) mod 9 = 0) then return true;
         else return false;
   end if;
   end check9;
   
   procedure perfect is
   S : Natural;
   begin
   for N in 1..10000 loop
      S := 0;
      for I in 1..N-1 loop
         if N mod I = 0 then
            S := S + I;
         end if;
      end loop;
      if S = N then
         Ada.Integer_Text_IO.Put( N );
      end if;
   end loop;
   end perfect;

   function sinx(x: Float) return Float is
      s : Float := x;
      t : Float := x;
      y : Float := x*x;
   begin
      for i in 1..2000000 loop
         t := ((-1.0)*t*y)/ (2.0*Float(i)*(2.0*Float(i)+1.0));
         s := s + t;
      end loop;   
      return s;
   end sinx;
      
end Math;
   

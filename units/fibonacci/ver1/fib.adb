with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Fibonacci;
procedure Fib is
   N : Positive;
begin
   Get( N );
   Put( Fibonacci(N) );
end Fib;

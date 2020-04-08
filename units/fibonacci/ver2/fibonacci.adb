function Fibonacci ( N: Positive ) return Positive is
begin
   if N < 3 then return 1;
   else return Fibonacci(N-1) + Fibonacci(N-2);
   end if;
end Fibonacci;

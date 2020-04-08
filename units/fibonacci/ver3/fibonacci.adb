function Fibonacci ( N: Positive ) return Positive is

    function F( N: Positive; A, B: Positive ) return Positive is
    begin
       if N = 1 then
          return A;
       else
          return F( N-1, A+B, A );
       end if;
    end F;

begin
   if N < 3 then return 1;
   else return F(N-1,1,1);
   end if;
end Fibonacci;

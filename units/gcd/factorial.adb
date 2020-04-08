function Factorial ( N: Natural ) return Positive is
begin
    if N > 1 then return N * Factorial (N-1);
             else return 1;
    end if;
end Factorial;

function Fact ( N: Natural ) return Positive is
begin
    return Fact(N-1) * N;
exception
    when Constraint_Error => return 1;
end Fact;

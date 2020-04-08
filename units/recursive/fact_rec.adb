function fact_rec ( N: Natural ) return Positive is
begin
    if N > 1 then return N * fact_rec (N-1);
             else return 1;
    end if;
end fact_rec;

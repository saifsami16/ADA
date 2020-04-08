function max_pos( T: TA) return Index is
p: Index:=T'First;
begin
   for i in T'Range loop
    if T(P) < T(I) then P:=I;
    end if;
   end loop;
return P;
end max_pos;

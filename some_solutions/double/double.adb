procedure double (a: in T; b: out boolean; i: out Index; j: out Index) is
begin
   b:=false;
   for k in a'First .. Index'Pred(a'Last) loop
      for l in Index'Succ(k)..a'Last loop
      if a(k)=a(l) then b:=true; i:=k; j:=l;
      end if;
      end loop;
   end loop;
end double;

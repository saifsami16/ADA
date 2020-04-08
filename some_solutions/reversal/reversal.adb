procedure reversal (a: in out T) is
   i: Index:= a'First;
   j: Index:= a'Last;
   tmp : Elem;
begin
   while i<j loop
      tmp:=a(i);
      a(i):=a(j);
      a(j):=tmp;
      i:=Index'Succ(i);
      j:=Index'Pred(j);
   end loop;
end reversal;

procedure reversal1 (a: in out T) is
   i: Index:= a'First;
   j: Index:= a'Last;
begin
   while i<j loop
      Swap(a(i),a(j));
      i:=Index'Succ(i);
      j:=Index'Pred(j);
   end loop;
end reversal1;

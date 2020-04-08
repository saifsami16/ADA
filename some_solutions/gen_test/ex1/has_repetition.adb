function has_repetition( T: Vector) return Boolean is

begin
   if T'length> 1 then
   for i in T'First..Index'Pred(T'Last) loop
      if T(i) = T(Index'Succ(i)) then return True;
      end if;
      end loop;
   end if;
   return False;
end has_repetition;

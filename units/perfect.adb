with Ada.Integer_Text_IO; 
procedure Perfect is
   S : Natural;
begin
   for N in 1..10000 loop
      S := 0;
      for I in 1..N-1 loop
         if N mod I = 0 then
            S := S + I;
         end if;
      end loop;
      if S = N then
         Ada.Integer_Text_IO.Put( N );
      end if;
   end loop;
end Perfect;

with Fact, Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
procedure Fact_Demo is
   N: Natural;
begin
   Get(N);
   Put(Fact(N));
end;

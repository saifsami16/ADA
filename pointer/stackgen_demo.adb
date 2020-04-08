with Stacksgen, Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Stackgen_Demo is

   package IStacks is new Stacksgen(Integer);
   use IStacks;
    V: Stack;
    X: Integer;
begin
    for I in 1..10 loop
       Push(V, I);
      Pop(V,X);
      put(X);
   end loop;
  -- Pop(V, X);
end Stackgen_Demo;

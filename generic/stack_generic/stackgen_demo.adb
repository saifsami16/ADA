with Stacksgen, Ada.Integer_Text_IO;

procedure Stackgen_Demo is

package IStacks is new Stacksgen(Integer);

procedure Put_Int( Item: Integer ) is
begin
Ada.Integer_Text_IO.Put(Item,0);
end Put_Int;

procedure Put_Stack is new IStacks.For_Each(Put_Int);

S: IStacks.Stack(5);

begin
IStacks.Push(S,3);
IStacks.Push(S,66);
   IStacks.Push(S,1);
   IStacks.Push(S,5);
   IStacks.Push(S,7);
Put_Stack(S);
end Stackgen_Demo;

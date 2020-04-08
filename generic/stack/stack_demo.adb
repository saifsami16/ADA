with Stacks, Integer_Stack, Ada.Command_Line, Ada.Integer_Text_IO, Ada.Float_Text_IO;
--use Integer_Stack;
procedure Stack_Demo is
    package Float_Stack is new Stacks(Float); use Float_Stack;
    N: Integer;
    F: Float;
    V: Integer_Stack.Stack(Ada.Command_Line.Argument_Count);
    W: Float_Stack.Stack(Ada.Command_Line.Argument_Count);
begin
    for I in 1..Ada.Command_Line.Argument_Count loop
       N := Integer'Value(Ada.Command_Line.Argument(I));
       Integer_Stack.Push( V, N );
    end loop;
    while not Integer_Stack.Is_Empty(V) loop
        Integer_Stack.Pop( V, N );
        F := Float(N) / 2.0;
        Push( W, F );
    end loop;
    while not Is_Empty(W) loop
        Pop( W, F );
        Ada.Float_Text_IO.Put(F);
    end loop;
end Stack_Demo;

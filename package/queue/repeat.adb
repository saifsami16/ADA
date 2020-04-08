with Lines, Ada.Command_Line, Ada.Integer_Text_IO; use Lines;
procedure repeat is
    N: Integer;
    S: Queue(Ada.Command_Line.Argument_Count);
begin
    for I in 1..Ada.Command_Line.Argument_Count loop
       N := Integer'Value(Ada.Command_Line.Argument(I));
       Hiext( S, N );
    end loop;
    while not Is_Empty(S) loop 
        Lopop( S, N );
        Ada.Integer_Text_IO.Put(N);
    end loop;
end repeat;


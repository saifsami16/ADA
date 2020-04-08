procedure Swap ( A, B: in out T ) is
    Tmp: T := A;
begin
    A := B;
    B := Tmp;
end Swap;

function Fold ( T: TArray ) return Elem is
    S: Elem := Start;
begin
    for I in T'Range loop
	    S := Op( S, T(I) );
    end loop;
    return S;
end Fold;

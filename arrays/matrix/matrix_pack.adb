package body Matrix_pack is
	
    procedure Add( A: in out Matrix; B: in Matrix ) is
    begin
        -- A := A+B;
        for I in A'Range(1) loop
            for J in A'Range(2) loop
                A(I,J) := A(I,J) + B( I-A'First(1)+B'First(1),
                                      J-A'First(2)+B'First(2) );
            end loop;
        end loop;
    end Add;

    function "+"( A, B: Matrix ) return Matrix is
        -- C: Mátrix := A;
        C: Matrix(A'Range(1),A'Range(2));
    begin
        -- Hozzáad(C,B);
        -- return C;
        for I in A'Range(1) loop
            for J in A'Range(2) loop
                C(I,J) := A(I,J) + B( I-A'First(1)+B'First(1),
                                      J-A'First(2)+B'First(2) );
            end loop;
        end loop;
        return C;
    end "+";

    function "*" ( A, B: Matrix ) return Matrix is
        C: Matrix( A'Range(1), B'Range(2) ) := (others => (others => 0));
    begin
        for I in C'Range(1) loop
            for J in C'Range(2) loop
                for K in A'Range(2) loop
                    C(I,J) := C(I,J) + A(I,K-B'First(1)+A'First(2)) * 
                                       B(K-A'First(2)+B'First(1),J);
                end loop;
            end loop;
        end loop;
        return C;
    end "*";
    
    function "*" ( E: Elem; M: Matrix ) return Matrix is
        C: Matrix(M'Range(1),M'Range(2));
    begin
        for I in M'Range(1) loop
            for J in M'Range(2) loop
                C(I,J) := E * M(I,J);
            end loop;
        end loop;
        return C;
    end "*";

    procedure Multiply ( E: in Elem; M: in out Matrix ) is
    begin
        for I in M'Range(1) loop
            for J in M'Range(2) loop
                M(I,J) := E * M(I,J);
            end loop;
        end loop;
    end Multiply;

end Matrix_pack;


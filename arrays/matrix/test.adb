with Ada.Text_IO, Matrix_pack;
use Ada.Text_IO, Matrix_pack;

procedure test is
	
    M: Matrix := ((1,2),(1,2),(3,2));
    I: Matrix := ((1,0),(0,1));

    procedure Print ( M: in Matrix ) is
    begin
        for I in M'Range(1) loop
            for J in M'Range(2) loop
                Put( Elem'Image(M(I,J)) );
                Put( Ascii.HT );
            end loop;
            New_Line;
        end loop;
    end Print;

begin
	
    M := 2 * M * I;
    Multiply(2,M);
    Print(M);

end test;


with Ada.Text_IO; use Ada.Text_IO;
procedure Prod is
    pragma Suppress(Range_Check);
    I: Integer range 1..10000 := 1;
begin
    for J in 1..100 loop
        Put_Line(Integer'Image(I));
        I := I * 10;
    end loop;
end;

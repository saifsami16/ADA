with swap, Ada.Text_IO;
use Ada.Text_IO;
procedure Swap_demo is
procedure Int_Swap is new Swap(Integer);
procedure Float_Swap is new Swap(Float);
X: Integer := 4; Y: Integer := 2;
U: Float := 1.2; V: Float := 2.1;
begin
Int_Swap(X,Y);
Float_Swap(U,V);
put_line(Integer'Image(X) & ", " & Integer'Image(Y));
put_line(Float'Image(U) & ", " & Float'Image(V));
end Swap_demo;

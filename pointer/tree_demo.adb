with Binary_Trees, Ada.Integer_Text_IO, Ada.Text_IO;
use Ada.Integer_Text_IO, Ada.Text_IO;
procedure Tree_Demo is
	package BT is new Binary_Trees(Integer);
	use BT;
	P,Q: Binary_Tree;

	procedure Put_Preorder( T: in Binary_Tree ) is
		procedure Put_Formatted( T: in Binary_Tree; Indent: in Natural ) is
		begin
			for I in 1..Indent loop
				Put(' ');
			end loop;
			if Is_Empty(T) then
				Put_Line("-");
			else
				Put( Get_Root(T), 0 ); New_Line;
				Put_Formatted( Get_Left(T), Indent+1 );
				Put_Formatted( Get_Right(T), Indent+1 );
			end if;
		end;
	begin
		Put_Formatted( T, 0 );
	end Put_Preorder;

begin
	Set_Root(P,5);
	Q := Construct(3,P,Empty);
	P := Construct(14,Q,Construct(7,Empty,Empty));
	P := Construct(1,P,Construct(9,Empty,Empty));
	Put_Preorder(P);
	Put_Preorder(Q);
	Free(P);
end;


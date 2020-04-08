with Ada.Text_IO;
use Ada.Text_IO;
-- locu made

procedure lab3 is

    type Index is new Integer;
    type Elem is new Integer;
    type Tomb is array (Index range <>) of Elem;
    type MDArray is array (Index range <>, Index range <>) of Elem;
	
	
	
	function DiagonalSum(T : MDArray) return Elem is
		Sum : Elem := 0;
	begin
		for I in T'Range(1) loop
			sum := sum + T(I,I-T'First(1)+T'First(2));
		end loop;
		return Sum;
	end DiagonalSum;
	
	function MaxPos(T : Tomb) return Index is
		Mh : Index := T'First;
	begin
		for I in Index'Succ(T'First)..T'Last loop --T'Range
			if T(I) > T(Mh) then
				Mh := I;
			end if;
		end loop;
		return Mh;
	end MaxPos;
	
	procedure Swap(A,B : in out Elem) is
		Tmp : Elem := A;
	begin
		A := B;
		B := Tmp;
	end Swap;
	
	procedure Order(T : in out Tomb) is
	begin
		for I in reverse T'Range loop
			Swap(T(I), T(MaxPos(T(T'First..I))));
		end loop;
	end Order;
	
    function Rec_Szumma ( T: Tomb ) return Elem is
    begin
        if T'Length = 0 then
			return 0;
		else 
			return T(T'First) + Rec_Szumma(T(Index'Succ(T'First)..T'Last));
		end if;
    end Rec_Szumma;
	t : Tomb := (3,2,5,7,1);
	tm : MDArray := ((11,22,33,44,55),(1,1,1,1,1),(2,2,2,2,2),(3,3,3,3,3),(0,0,0,0,0));
begin
   Order(t);
   Put_Line("The sum of array:");
   Put_Line( Elem'Image( Rec_Szumma(t) ) );
    Put_Line("The sorted array:");
   for I in T'Range loop
	Put_Line(Elem'Image(T(I)));
   end loop;
   New_line;
   Put_Line("Diagonal Sum ="& Elem'Image( DiagonalSum(tm) ) );
end lab3;

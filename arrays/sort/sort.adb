with Ada.Text_IO;
use Ada.Text_IO;

procedure sort is    
	
    type Index is new Integer;
    type Elem is new Integer;
    type TArray is array (Index range <>) of Elem;

    function Max_Pos ( T: TArray ) return Index is
        Mh: Index := T'First;
    begin
        for I in T'Range loop
            if T(Mh) < T(I) then
                Mh := I;
            end if;
        end loop;
        return Mh;
    end Max_Pos;

    procedure Swap ( A, B: in out Elem ) is
        Tmp: Elem := A;
    begin
        A := B;
        B := Tmp;
    end Swap;
    
    procedure Order ( T: in out TArray ) is
        Mh: Index;
    begin
        for I in reverse T'Range loop
            Mh := Max_Pos( T(T'First..I) );
	    Swap( T(I), T(Mh) );
        end loop;
    end Order;

    T: TArray := (3,6,1,5,3);

begin
    Order(T);
    for I in T'Range loop
       Put_Line( Elem'Image( T(I) ) );
    end loop;
end sort;

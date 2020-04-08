with Ada.Text_IO;
use Ada.Text_IO;

procedure sort_rec is    
	
    type Index is new Integer;
    type Elem is new Integer;
    type TArray is array (Index range <>) of Elem;

    function Max_Pos ( T: TArray ) return Index is
        M: Index := T'First;
    begin
        for I in T'Range loop
            if T(M) < T(I) then
                M := I;
            end if;
        end loop;
        return M;
    end Max_Pos;

    procedure Swap ( A, B: in out Elem ) is
        Tmp: Elem := A;
    begin
        A := B;
        B := Tmp;
    end Swap;
    
    procedure Order ( T: in out TArray ) is
        M: Index;
   begin 
       if T'Length > 1 then
            M := Max_Pos( T );
	    Swap( T(T'Last), T(M) );
	    Order( T(T'First..Index'Pred(T'Last)) );
        end if;
    end Order;

    T: TArray := (3,6,1,5,3);

begin
    Order(T);
    for I in T'Range loop
       Put_Line( Elem'Image( T(I) ) );
    end loop;
end sort_rec;

with Ada.Text_IO;
use Ada.Text_IO;

procedure Sumrec is

    type Index is new Integer;
    type Elem is new Integer;
    type Tömb is array (Index range <>) of Elem;

    function Addrec ( T: Tömb ) return Elem is
        begin
        if T'Length > 0 then
         return T(T'First) + Addrec (T(Index'Succ(T'First)..T'Last));
         else return 0;
        end if;
   end Addrec;
    function Addrec1 ( T: Tömb ) return Elem is
        begin
        if T'Length > 1 then
         return T(T'First) + Addrec1 (T(Index'Succ(T'First)..T'Last));
         else return T(T'First);
        end if;
   end Addrec1;
   function Addrec2 ( T: Tömb ) return Elem is
        begin
        if T'Length > 0 then
         return T(T'Last) + Addrec1 (T(T'First..Index'Pred(T'Last)));
         else return 0;
        end if;
    end Addrec2;
    a : Tömb(1..5):=(1,2,3,4,5);
begin

   Put_Line( Elem'Image( Addrec(a)));
   Put_Line( Elem'Image( Addrec1(a)));
   Put_Line( Elem'Image( Addrec2(a)));
end Sumrec;

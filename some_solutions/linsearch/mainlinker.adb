with linker, Ada.Text_IO;
use Ada.Text_IO;
procedure mainlinker is

    type Index is new Integer;
    type Elem is new Integer;
    type T is array (Index range <>) of Elem;

   function myprop (x: Elem) return Boolean is
   begin
      return (x<0);
   end myprop;

   k: Index;
   vane: Boolean;
   a: T(1..5):=(1,2,3,4,5);
   a1: T(1..5):=(1,-2,3,-4,5);
   a2: T(1..5):=(1,2,3,4,-5);
    procedure Mylinker is new linker (Elem, Index, T, myprop);
begin
   mylinker(a, vane, k);

   if vane then Put_Line( Elem'Image(a(k)) );
   else Put_Line("nincs negativ elem");
   end if;

   mylinker(a1, vane, k);

   if vane then Put_Line( Elem'Image(a1(k)) );
      else Put_Line("nincs negativ elem");
   end if;

   mylinker(a2, vane, k);

   if vane then Put_Line( Elem'Image(a2(k)) );
      else Put_Line("nincs negativ elem");
   end if;
end mainlinker;

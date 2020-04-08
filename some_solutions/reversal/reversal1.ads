generic

   type Elem is limited private;
   type Index is (<>);
   type T is array(Index range <>) of Elem;
   with procedure Swap(x,y: in out Elem);

procedure reversal1(a: in out T);

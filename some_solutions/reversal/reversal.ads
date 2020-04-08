generic

   type Elem is private;
   type Index is (<>);
   type T is array(Index range <>) of Elem;

procedure reversal (a: in out T);

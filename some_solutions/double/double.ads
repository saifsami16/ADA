generic

   type Elem is private;
   type Index is (<>);
   type T is array(Index range <>) of Elem;

procedure double (a: in T; b: out boolean; i: out Index; j: out Index);

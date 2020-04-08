generic

   type Elem is limited private;
   type Index is (<>);
   type T is array(Index range <>) of Elem;
  -- with function "=" (x,y: Elem) return Boolean;
   with function "=" (x,y: Elem) return Boolean is <>;
procedure double2 (a: in T; b: out boolean; i: out Index; j: out Index);

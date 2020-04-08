generic
    type Elem is private;
    type Index is (<>);
    type T is array ( Index range <> ) of Elem;
    with function Prop( A: Elem ) return Boolean;

procedure Linker (x:T; b: out Boolean; j: out Index);

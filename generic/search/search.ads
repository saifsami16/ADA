generic
    type Elem is private;
    type Index is (<>);
    type TArray is array ( Index range <> ) of Elem;
    with function Prop(a: Elem) return Boolean;
procedure Search(t: TArray; b: out Boolean; j: out Index);

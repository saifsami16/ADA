generic
    type Elem is private;
    type Index is (<>);
    type TA is array (Index range <>) of Elem;
    with function "<" ( A, B: Elem ) return Boolean is <>;

procedure Sort ( T: in out TA);
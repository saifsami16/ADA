generic
    type Elem is private;
    type Index is (<>);
    type TArray is array ( Index range <> ) of Elem;
    with function Op( A, B: Elem ) return Elem;
    Start: in Elem;

function Fold ( T: TArray) return Elem;


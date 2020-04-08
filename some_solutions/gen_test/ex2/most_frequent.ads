generic
    type Elem is private;
    type Index is (<>);
    type Vector is array ( Index range <> ) of Elem;


function most_frequent( T: Vector) return Elem;

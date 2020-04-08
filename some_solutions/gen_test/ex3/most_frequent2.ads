generic
    type Elem is private;
    type Index is (<>);
    type Vector is array ( Index range <> ) of Elem;


function most_frequent2( T: Vector) return Natural;

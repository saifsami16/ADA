generic
    type A is private;
    type B is private;
    type Index is (<>);
    type TA_Array is array ( Index range <> ) of A;
    type TB_Array is array ( Index range <> ) of B;
    with function Op(x: A) return B;
function Map(ta: TA_Array) return TB_Array;

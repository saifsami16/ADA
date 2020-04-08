generic

type A is private;
type B is private;
type Index is (<>);
type TA is array ( Index range <> ) of A;
type TB is array ( Index range <> ) of B;
with function op(v: A) return B;

function map (x: TA) return TB;

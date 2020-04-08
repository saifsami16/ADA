generic
type T is private;
   with function "<" (A, B: T) return Boolean;
  -- with function "<" (A, B: T) return Boolean is <>;
function Maximum ( A, B: T ) return T;

package Setq is

    type Rational is private;

    function Numerator ( R: Rational ) return Integer;
    function Denominator ( R: Rational ) return Positive;

    function "/" (Numerator : Integer; Denominator: Positive ) return Rational;
    function "/" ( X, Y: Rational ) return Rational;
    function "/" ( X: Rational; Y: Positive ) return Rational;

    -- function "=" ( X, Y: Rational ) return Boolean;

private

    type Rational is record
                           Numerator: Integer := 0;
                           Denominator: Positive := 1;
                       end record;

end Setq;

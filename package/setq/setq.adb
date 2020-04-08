with gcd;

package body Setq is

    function Numerator ( R: Rational ) return Integer is
    begin
        return R.Numerator;
    end;

    function Denominator ( R: Rational ) return Positive is
    begin
        return R.Denominator;
    end;

    function Normalize ( Numerator: Integer; Denominator: Positive )
    return Rational is
    begin
        if Numerator = 0 then
            return (0,1);
        else
            declare
                H: Positive := gcd( abs Numerator, Denominator );
            begin
                return (Numerator/H, Denominator/H);
            end;
        end if;
    end;

    function "/" ( Numerator: Integer; Denominator: Positive ) return Rational is
    begin
        return Normalize( Numerator, Denominator );
    end;

    function "/" ( X, Y: Rational ) return Rational is
    begin
        return Normalize( X.Numerator * Y.Denominator,  X.Denominator * Y.Numerator );
    end;

    function "/" ( X: Rational; Y: Positive ) return Rational is
    begin
        return Normalize( X.Numerator,  X.Denominator * Y );
    end;

    -- function "=" ( X, Y: Rational ) return Boolean is
    -- begin
    --     return X.Numerator * Y.Denominator = Y.Numerator * X.Denominator;
    -- end;

end Setq;


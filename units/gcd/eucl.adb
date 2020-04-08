procedure eucl( A, B: in Positive; GCD, LCM: out Positive ) is
     X: Positive := A;
     Y: Positive := B;
begin
     while X /= Y loop
          if X > Y then X := X - Y; else Y := Y - X; end if;
     end loop;
    GCD := X;
    LCM := A * B / GCD ;
end eucl;

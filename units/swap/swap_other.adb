procedure swap_other ( A, B : in out Integer ) is
begin
   A := A + B;
   B := A - B;
   A := A - B;
end swap_other;
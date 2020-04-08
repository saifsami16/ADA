function eucl_rec ( A, B : Positive ) return Positive is
   function F ( A, B : Natural ) return Positive is
   begin
      if B = 0 then
         return A;
      else
         return F( B, A mod B );
      end if;
   end F;
begin
   return F( A, B );
end eucl_rec;
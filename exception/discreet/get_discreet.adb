with TEXT_IO; use TEXT_IO;
function Get_Discreet return Element is
   Str: String(1..Element'Width+1);
   Len: Natural;
begin
   loop
      declare
      begin
          Get_Line(Str,Len);
          if Len <= Element'Width then
              return Element'Value( Str(1..Len) );
          else Skip_Line;
          end if;
      exception
          when Constraint_Error => null;
      end;
   end loop;
end Get_Discreet;

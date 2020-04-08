procedure Linker (x:T; b: out Boolean; j: out Index) is
begin
   b:= false;
   for i in reverse x'range loop
      if Prop(x(i)) then b:= true; j:= i;
      end if;
   end loop;
end linker;

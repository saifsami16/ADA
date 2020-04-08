function map (x: TA) return TB is
y: TB(x'range);

begin
   for i in x'range loop
      y(i):= op(x(i));
   end loop;
   return y;
end map;

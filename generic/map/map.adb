function Map(ta: TA_Array) return TB_Array is
tb:TB_Array(ta'Range);
begin
for i in ta'Range loop
tb(i):=op(ta(i));
   end loop;
return tb;
end Map;

with TEXT_IO,ada.integer_text_io,ada.command_line;
 use TEXT_IO,ada.integer_text_io,ada.command_line;
procedure tick is
task type print(nev:INTEGER:=42);
task body print is
 begin
  loop
   put(nev);
   new_line;
   if argument_count>0 then
    delay duration'value(argument(1));
   end if;
  end loop;
 end print;

a:print;
b:print(1);
c:print(2);
begin
 put(0);
 new_line;
end tick;
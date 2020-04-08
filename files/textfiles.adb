with text_io; use text_io;
procedure Textfiles is

	package int_io is new integer_io(integer); use int_io;

	f: file_type;
	i: integer;

begin
	Create(f,name=>"numbers.txt");
	while not end_of_file loop
		while not end_of_line loop
			Get(i);
			Put(f,i);
		end loop;
		Skip_Line;
		New_Line(f);
	end loop;
	Close(f);

	Open(f,name=>"numbers.txt",mode=>in_file);
	while not end_of_file(f) loop
		while not end_of_line(f) loop
			Get(f,i);
			Put(i);
		end loop;
		Skip_Line(f);
		New_Line;
	end loop;
	Close(f);
end Textfiles;

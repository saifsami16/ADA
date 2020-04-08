with text_io, sequential_io; use text_io;
procedure seqfiles is
	package int_io is new integer_io(integer); use int_io;
	package sio is new sequential_io(integer); use sio;
	f: sio.file_type;
	i: integer;
begin
	Create(f,out_file,"numbers.int");
	while not end_of_file loop
		Get(i);
		Write(f,i);
	end loop;
	Close(f);

	Open(f,in_file,"numbers.int");
	while not end_of_file(f) loop
		Read(f,i);
		Put(i);
	end loop;
	Close(f);
end seqfiles;
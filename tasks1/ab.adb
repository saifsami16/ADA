with text_io; use text_io;
procedure AB is
	task A;
	task B;

	task body A is
	begin
	  for i in 1..POSITIVE'LAST loop
	    Put_Line("A:"&POSITIVE'IMAGE(i));
	  end loop;
	end A;

	task body B is
	begin
	  for i in 1..POSITIVE'LAST loop
	    Put_Line("B:"&POSITIVE'IMAGE(i));
	  end loop;
	end B;

begin
  null;
end AB;
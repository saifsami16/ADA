with text_io; use text_io;
procedure jm is

	task type Print is
		entry Init ( s: in STRING := "" );
	end Print;

	a, b: Print;

	task body Print is
		type PStr is access STRING;
		nev: PStr;
	begin
	  accept Init ( s: in STRING := "" ) do 
	  	nev := new STRING(1..s'length);
		nev.all := s;
	  end Init;
	  for i in POSITIVE'range loop
	    Put_Line(nev.all & POSITIVE'IMAGE(i));
	  end loop;
	end Print;

begin
	a.Init("John"); b.Init("Mary");
end jm;
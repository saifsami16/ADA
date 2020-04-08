with text_io; use text_io;
procedure semafor is

	task type Print is
		entry Init ( s: in STRING := "" );
	end Print;

	a, b: Print;

	task Semaf is
		entry P;
		entry V;
	end Semaf;

	task body Semaf is
	begin
		loop
			accept P;
			accept V;
		end loop;
	end Semaf;

	task body Print is
		type PStr is access STRING;
		nev: PStr;
	begin
	  accept Init ( s: in STRING := "" ) do 
	  	nev := new STRING(1..s'length);
		nev.all := s;
	  end Init;
	  for i in POSITIVE'range loop
	    Semaf.P;
	    Put_Line(nev.all & POSITIVE'IMAGE(i));
	    Semaf.V;
	  end loop;
	end Print;

begin
	a.Init("John"); b.Init("Mary");
end semafor;
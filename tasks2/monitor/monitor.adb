with text_io; use text_io;
procedure Monitor is
       task type Print is
		entry Init ( s: in STRING := "" );
	end Print;

        a, b: Print;
   
        protected Screen is
		entry Print ( s: in STRING );
	end Screen;

	protected body Screen is
		entry Print ( s: in STRING ) when true is
                begin Put_Line(s); 
                end Print;
	end Screen;
	task body Print is
		type PStr is access STRING;
		name: PStr;
	begin
	  accept Init ( s: in STRING := "" ) do 
	  	name := new STRING(1..s'length);
		name.all := s;
	  end Init;
	  for i in POSITIVE'range loop
	    Screen.Print(name.all & POSITIVE'IMAGE(i));
	  end loop;
	end Print;

begin
	a.Init("John"); b.Init("Mary");
end Monitor;

with Tools; use Tools;
procedure Pub5 is

	Door: Semafor(5);

	type Drinks is (Beer, Wine, Brandy);

	task Barman is
		entry Order( w: in Drinks );
	end Barman;

	task body Barman is
		working: Boolean := True;
		T: constant array(Drinks) of Duration := (1.0, 0.5, 0.7);
	begin
		while working loop
			select
				accept Order( w: in Drinks ) do
					Monitor.Print( Drinks'Image(w));
					delay T(w);
				end Order;
			or
				delay 2.0;
				working := False;
			end select;
		end loop;
		Monitor.Print("Barman left.");
	end Barman;

	task type Fellow;
	task body Fellow is

		procedure Going is
			l: Boolean := False;
		begin
			while not l loop
				select
					Door.P;
					l := True;
				else
					Monitor.Print("Going to sleep");
					delay 2.0;
				end select;
			end loop;
		end Going;

		procedure Drinking is
			Sorivas_Ideje: Duration := 1.0;
		begin
			Barman.Order(Brandy); Monitor.Print("Brandy..."); delay 0.1;
			Barman.Order(Wine); Monitor.Print("Wine..."); delay 0.5;
			loop
				Barman.Order(Beer); Monitor.Print("Beer..."); 
				delay Sorivas_Ideje;
				Sorivas_Ideje := 2 * Sorivas_Ideje;
			end loop;
		exception
			when Tasking_Error => Monitor.Print("Going away");
			when others => Monitor.Print("I got drunk...");
		end Drinking;

	begin
		Going;
		Drinking;
		Door.V;
	end Fellow;

	Fellows: array(1..2) of Fellow;

	type String_Access is access String;

	task type Student( N: String_Access );
	task body Student is
		rt: Duration;
	begin
		select
			Door.P;
			declare begin
				Barman.Order(Wine);
				Monitor.Print( N.all & " drinking wine" );
				Randomize.timing(rt,0.5,1.5);
				delay rt;
			exception
				when Tasking_Error => 
					Monitor.Print(N.all & " going to course");
				when others => 
					Monitor.Print(N.all & " got drunk...");
			end;
			Door.V;
		or
			delay 1.0;
			Monitor.Print(N.all & " has to go to course.");
		end select;
	end;

	type Student_Access is access Student;
	EP: Student_Access;

begin
	Randomize.Init;
	delay 0.2; EP := new Student( new String'("John") );
	delay 0.2; EP := new Student( new String'("Cole") );
	delay 0.2; EP := new Student( new String'("Peter") );
end Pub5;

with Ada.Text_IO, Ada.Calendar, Ada.Numerics.Discrete_Random, Tools;
use Ada.Text_IO, Tools;

procedure Pub4 is

  Door: Tools.Semafor(5);
  procedure Go_in renames Door.P;
  procedure Go_out renames Door.V;
  
  type Drinks is (Beer, Wine, Brandy);

  task Barman is
     entry Order( what: in Drinks );
  end Barman;

  task body Barman is
     t: constant array(Drinks) of Duration := (1.0,0.5,0.2);
     gohome: Boolean := False;
  begin
     while not Gohome loop
        select
           accept Order( what: in Drinks ) do
	     Put_Line("Ordered: " & Drinks'Image(what));
	     delay t(what);
	  end Order;
	or
	  delay 3.0;
	  Gohome := True;
        end select;
     end loop;
     Put_Line("Barman went home.");
  end Barman;

  type String_Access is access String;

  task type Fellow is
     entry Start( N: in String_Access );
  end Fellow;

  task body Fellow is
     bt: Duration := 2.0;
     Name: String_Access;
     isIn: Boolean := False;
  begin 
     accept Start( N: in String_Access ) do
        Name := N;
     end;
     Put_Line("Fellow: " & Name.all);
     while not isIn loop
       select
         Go_in;
	 isIn := True;
       else
         Put_Line("Fellow " & Name.all & "went to the parc.");
         delay 1.2;
       end select;
     end loop;
     Put_Line("A fellow entered: " & Name.all);
     Barman.Order(Brandy);
     delay 0.1;
     Barman.Order(Wine);
     delay 0.3;
     loop
         Barman.Order(Beer);
         delay bt;
	 bt := 2*bt;
     end loop;
  exception
      when Tasking_Error => Put_Line(Name.all & " searching for other pub "); 
         Go_out;
  end Fellow;
  
  Fellows: array (1..10) of Fellow;

  task type Student( N: String_Access; wh: Drinks );
  type Student_Access is access Student;

  task body Student is
     F: Float;
  begin
     Put_Line("A student came: " & N.all);
     select
       Go_in;
       Barman.Order(wh);
       Random.Generate(F);
       delay 0.1 + Duration(F);
       Put_Line(N.all & " hazamegy.");
       Go_out;
     or
       delay 1.1;
       Put_Line(N.all & " went to Ada course.");
     end select;
  end Student;
  
  E: Student_Access;

  Course: Ada.Calendar.Time := Ada.Calendar."+"( Ada.Calendar.Clock, 1.0 );

  task Professor;

  task body Professor is
  begin
     Put_Line("Professor: I got some time before course.");
     select
       Go_in;
       Barman.Order(Brandy);
       delay 0.2;
       Put_Line("Professor: it was good");
       Go_out;
     or
       delay until Course;
       Put_Line("Professor: goint to course");
     end select;
  end Professor;

  package Drinks_Random is new Ada.Numerics.Discrete_Random(Drinks);
  G: Drinks_Random.Generator;

  F: Float;
  
begin
  Drinks_Random.Reset(G);
  for I in Fellows'Range loop
     E := new Student( new String'("E-" & Integer'Image(I)), Drinks_Random.Random(G) );
     Fellows(I).Start(  new String'("R-" & Integer'Image(I))  );
     Random.Generate(F);
     delay Duration(0.9 + F/5.0);
  end loop;
end Pub4;


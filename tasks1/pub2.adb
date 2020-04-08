with Ada.Text_IO; use Ada.Text_IO;

procedure Pub2 is

   type Drinks is (Bier, Wine, Brandy);

   task Barman is
      entry Order( what: in Drinks);
   end Barman;
   
task Door is
	entry Go_in;
	entry Go_out;
end Door;

task type Fellow;
Fellows: array (1..5) of Fellow;

task type Student is
	entry Name( s: in string := "");
end Student;
Students: array (1..3) of Student;
type PStudent is access Student;
Stud: PStudent;




task body Barman is
	dtime: constant array (Drinks) of duration := (1.0,0.1,0.2);
	closingtime: constant duration := 5.0;
begin
  loop
    select
      accept Order( what: in Drinks ) do 
        Put_Line(Drinks'IMAGE(what)&" was ordered.");
        delay dtime(what);
      end Order;
    or
      delay closingtime;
      exit;
    end select;		
  end loop;
end Barman;


task body Door is
	inside: NATURAL := 0;
begin
  loop
    select
      accept Go_out; inside := inside-1;
    or
      when inside < 5 => accept Go_in; inside := inside+1;
    or
      terminate;
    end select;
  end loop;
end Door;



task body Fellow is
	ctime: constant array (Drinks) of duration := (2.0,1.0,0.2);
	factor: positive := 1;
begin
  loop
    select
      Door.Go_in;
      Barman.Order(Brandy); delay ctime(Brandy);
      Barman.Order(Wine); delay ctime(Wine);
      loop
        Barman.Order(Bier);
        delay ctime(Bier)*factor;
        factor := factor+1;
      end loop;
    else
      Put_Line("Going to sleep in the parc.");
      delay 5.0;
    end select;
  end loop;
exception
  when tasking_error =>     
    Put_Line("Closed?"); 
    Door.Go_out;
end Fellow;


task body Student is
	type PString is access string;
	n: PString;
begin
  accept Name( s: in string := "" ) do n := new string'(s); end;
  select
    Door.Go_in;
    Barman.Order(Wine); Put_Line(n.all&" drinking wine"); delay 3.0;
    Door.Go_out;
  or
    delay 1.0;
    Put_Line(n.all & ": going to Ada course");
  end select;
end Student;


begin
  for i in Students'range loop
    Students(i).Name;
  end loop;
  delay 2.0;
  Stud := new Student;
  Stud.Name("Mary");
  delay 5.0;
  Stud := new Student;
  Stud.Name("John");
end Pub2;


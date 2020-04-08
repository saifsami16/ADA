with Ada.Text_IO; use Ada.Text_IO;

procedure Pub3 is

   type Drinks is (Beer, Wine, Brandy);

   task Barman is
      entry Order( what: in Drinks);
   end Barman;
  
   protected Door is
	entry Go_in;
	procedure Go_out;
	function Stats return float;
   private
	max: natural := 5;
	inside: natural := 0;
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

protected body Door is
	entry Go_in when inside<max is begin inside := inside+1; end;
	procedure Go_out is begin inside := inside-1; end;
	function Stats return float is
		begin return float(inside)/float(max); end;
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
        Barman.Order(Beer);
        delay ctime(Beer)*factor;
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
end Pub3;


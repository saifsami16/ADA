with Ada.Text_IO, Ada.Numerics.Discrete_Random, Ada.Calendar;
use Ada.Text_IO;
procedure chicken is 

Gone: exception;
Fly : exception;


task chicken is 
	entry feed;
	entry play;

end;

task body chicken is
seedInStomache: Natural:=4;
losingTime: Ada.Calendar.Time := Ada.Calendar."+"( Ada.Calendar.Clock, 0.1 );
begin



while seedInStomache >= 0 and seedInStomache < 30 loop
	select
		accept feed do
			seedInStomache:=seedInStomache+1;
			Put_Line("chicken: i am getting fed " & Natural'Image(seedInStomache));
		
		end; 
	or 
		accept play do
			seedInStomache:=seedInStomache-1;
			Put_Line("chicken: I am playing with a kid " & Natural'Image(seedInStomache));
		end ;
	or
		delay until losingTime;
		Put_Line("chicken: loosing a seed");
		seedInStomache:=seedInStomache-1;
	end select;
end loop;

if seedInStomache=0 then
	raise Gone;
	else
		if seedInStomache = 30 then
			Put("flought away!");
		end if;
end if;


end;

package chickenR is new Ada.Numerics.Discrete_Random(Boolean);
use chickenR;
G: chickenR.Generator;
task kid;
task body kid is 
B: Boolean;
begin

loop
	B:=random(G);
	if B then
		chicken.feed;
		Put_Line("kid is feeding the chicken");

	else
		chicken.play;
		Put_Line("kid is playing with the chicken");
	end if;
	
end loop;
exception
when tasking_error => Put("no chicken kid is sad!");
when Gone => Put("chicken died , kid is sad!");

end;



begin
chickenR.reset(G);
end;
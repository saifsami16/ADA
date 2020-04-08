with ada.text_io;
use ada.text_io;

procedure trafficlight is
type color is (red,yellow,green);

protected lamp is
	entry pass;
	procedure change;
	function isColor return color;
	private
	lamp : color := red;
	control : Natural :=0;
end lamp;


protected body lamp is
entry pass when lamp = green is begin
	put_line(" car has been passed ");
end pass;


procedure change is
begin
	put_line(color'image(lamp));
	if lamp = green then
		lamp := red;
	else
		lamp := color'succ(lamp);
	end if;
end change;

function isColor return color is
begin
	return lamp;
end isColor;

end lamp;

task scheduler;

task body scheduler is 
begin
for i in 1..3 loop
	lamp.change;
	delay 2.0;
	lamp.change;
	delay 1.5;
	lamp.change;
	delay 0.5;
	end loop;
end scheduler;
type pstr is access STRING;
type pduration is access Duration;
task type car(plateNumber: Pstr; carDuration : pduration);
task body car is
passed : Boolean:=false; 
begin
	delay carDuration.all;
	while not passed loop
	select 
		lamp.pass; passed:=true; put_line(plateNumber.all & " has passed ");
	or
		delay 0.2;
	end select;
	end loop;
end car;
type pcar is access car;
ptcar : array (1..3) of pcar;

begin
ptcar(1):= new car (new STRING'("abc-123"),new Duration'(1.0));
ptcar(2):= new car (new STRING'("zcv-677"),new Duration'(5.2));
ptcar(3):= new car (new STRING'("bcd-321"),new Duration'(10.5));

end trafficlight;


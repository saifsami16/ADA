with Ada.Text_IO;

package body Tools is

	protected body Randomize is
		procedure Init is
		begin
			Reset(G);
			Initial := True;
		end Init;

		entry Timing(
			value: out Duration;
			from: in Duration := 0.0;
			to: in Duration := 1.0
			)
		when Initial is
		begin
			value := Duration(Random(G)) * (to-from) + from;
		end Timing;
	end Randomize;

	task body Monitor is
	begin
		loop
			select
				accept Print( s: in String ) do
					Ada.Text_IO.Put_Line(s);
				end Print;
			or
				terminate;
			end select;
		end loop;
	end Monitor;

	protected body Semafor is
		entry P when ins > 0 is
		begin
			ins := ins - 1;
		end P;

		procedure V is begin ins := ins + 1; end V;
	end Semafor;

end Tools;

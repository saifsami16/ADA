with Ada.Numerics.Float_Random;
use Ada.Numerics.Float_Random;
package Tools is

	protected Randomize is
		procedure Init;
		entry timing(
			value: out Duration;
			from: in Duration := 0.0;
			to: in Duration := 1.0
			);
	private
		G: Generator;
		Initial: Boolean := False;
	end Randomize;

	task Monitor is
		entry Print( s: in String );
	end Monitor;

	protected type Semafor( Max: Positive := 1 ) is
		entry P;
		procedure V;
	private
		ins: Natural := Max;
	end Semafor;

end Tools;

package body Tools is

  task body Semafor is
     Inside: Natural := 0;
  begin
     loop
        select
           when Inside < Max => accept P; Inside := Inside + 1;
	or
	   accept V; Inside := Inside - 1;
	or
	   terminate;
	end select;
     end loop;
  end Semafor;

  protected body Random is
      procedure Reset is 
      begin Ada.Numerics.Float_Random.Reset(G); 
         Initial := True; 
      end Reset;
      entry Generate( F: out Float ) when Initial is 
      begin F := Ada.Numerics.Float_Random.Random(G); 
      end Generate;
  end Random;
  
begin
  Random.Reset;
end Tools;


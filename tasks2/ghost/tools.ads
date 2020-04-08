package tools is

   protected Output is
      procedure Puts(str: String; num:Natural:=0); 
   end Output;

   generic
      type T is (<>);	
   package Random_Generator IS
         --package Gen is new Ada.Numerics.Discrete_Random(T);
         function GetRandom return T;
   end Random_Generator;

end tools;
with tools, hauntedhouse, Ada.Numerics.Discrete_Random;
use tools, hauntedhouse;

procedure main is
   task princess is
      entry scare (pos: Position);
   end princess;

   type Direction is (up, down, left, right);
   package DR is new Ada.Numerics.Discrete_Random(Direction);
   use DR;

   task body princess is
      p: Position := (1,3);
      life: Natural := 3;
      ge: Generator;
      x: Direction; b: Boolean := false;

   begin
      Reset(ge);
      while life > 0  and (not (GetField(p) = E)) loop
         b:= false;
         while not b loop
         x:= random(ge);
         if x = up then p.y := p.y-1;
         elsif x = down then p.y := p.y+1;
         elsif x = left then p.x := p.x-1;
         elsif x = right then p.x := p.x+1;
         end if;
         b:= IsCorrect(p);
         end loop;
         Output.Puts("Princess at :"  & Natural'Image(p.x) & ", " & Natural'Image(p.y) & " " & Natural'Image(life), 1);
         select
            when (GetField(p) = C) and (not (GetField(p) = E)) =>
               accept scare(pos: Position) do
                  if (pos.x = p.x) and (pos.y = p.y) then
                     life := life - 1;
                     Output.Puts("I am scared: " & Natural'Image(life), 1);
                  end if;
               end scare;
           or delay 1.0;
         end select;
         end loop;
      Output.Puts("PRINCESS DIED", 1);
   end princess;

   type PDuration is access Duration;


   task type ghost(d: PDuration);
   task body ghost is
      r: Position;
   begin
      while Princess'Callable loop
         r:= GetRandPos;
         select
            Princess.scare(r); Output.Puts("Im being scary", 1);
         or delay d.all;
         end select;
         --Output.Puts("Ghost at :"  & Natural'Image(r.x) & ", " & Natural'Image(r.y), 1);
         delay 0.2;
      end loop;
   end ghost;

   --Ghosts: array (1..3) of ghost;
   type PGhost is access Ghost;


   task type wizard( nr: Positive; d: PDuration);
   task body wizard is
      g: array (1..nr) of PGhost;
   begin
      for i in 1..nr loop
         g(i) := new Ghost (d);
      end loop;
   end wizard;



   type PWizard is access wizard;
   oz: PWizard;
begin
   oz := new Wizard(5, new Duration'(0.5));
end main;

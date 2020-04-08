with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;

procedure exercise34 is

   type color is (Red, Yellow, Green);
   type PString is access String;
   type PDuration is access Duration;
   type Directions is (Straight, Turn);
   A: PString;
   B: PString;
   C: PString;
   D: PDuration;
   E: PDuration;
   F: PDuration;
   package RandomDir is new Ada.Numerics.Discrete_Random(Directions);
   use RandomDir;

   protected Direction is
      procedure init;
      entry passDir(dir: out Directions);
   private
      G: Generator;
      Initial : Boolean := False;
   end Direction;

   protected body Direction is
      procedure init is
      begin
         RandomDir.Reset(G);
         Initial := True;
      end;
      entry passDir(dir: out Directions) when Initial is
      begin
         dir := Random(G);
      end;
   end Direction;

   protected lamp is
      entry pass;
      procedure change;
      function isColor return color;
   private
      light : color := Red;
   end lamp;

   protected body lamp is
      entry pass when light = green is
         begin
            Put_Line("A car has passed");
         end pass;

         procedure Change is
         begin
            if light = color'Last then light := color'First;
            else light := color'Succ(light);
            end if;
            Put_Line(color'Image(light));
         end Change;

         function isColor return color is
         begin return light; end isColor;

      end lamp;

      task type Car(w:PString; d:PDuration);

      task body Car is
      b:Boolean := false;
      n:Directions;
      begin
         delay d.all;
         while not b loop
            select
            lamp.pass; Put_Line(w.all); Direction.passDir(n); Put_Line(Directions'Image(n));
            b:= true;
            or
               delay 0.2; Put_Line("waits");
            end select;
         end loop;
   end car;



   type PCar is access car;
   Cars: array(1..3) of PCar;

   task scheduler is
      entry stop;
   end;

   task body scheduler is
      Finished: Boolean := false;
   begin
      while not Finished loop
         select
            accept stop do
               Finished:= True;
            end stop;
         or
            delay 1.0;
         end select;
         lamp.change;
         delay 2.0;
         lamp.change;
         delay 1.5;
         lamp.change;
         delay 0.5;
      end loop;
   end scheduler;

   task engineer;
   task body engineer is
   begin
      delay 15.0; scheduler.stop; Put_Line("Simulation ended");
   end;

begin
   --For I in Cars'Range loop
   Direction.init;
   A:= new String'("abc-123");
   B:= new String'("def-456");
   C:= new String'("ghj-789");
   D:= new Duration'(3.0);
   E:= new Duration'(6.0);
   F:= new Duration'(9.0);
   Cars(1) := new Car(A,D);
   Cars(2) := new Car(B,E);
   Cars(3) := new Car(C,F);

   --end loop;

end exercise34;

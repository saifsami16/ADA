package hauntedhouse is

   -- W: Wall, R: Room, C: Corridor, E: Exit
  type Fields is (W,R,C,E);

  type Position is record
     x: Natural;
     y: Natural;
  end record;

  function IsWall(pos: Position) return Boolean;  
  function IsCorrect(pos: Position) return Boolean;
  function GetField(pos:Position) return Fields;
  function GetRandPos return Position; 
   
   private
      type field_array is array(Natural range <>,Natural range <>) of Fields; 
       House: constant field_array(1..5,1..5):= ((C,C,C,W,R),
					          (R,W,C,W,C),
					          (W,C,C,R,R),
					          (C,R,W,W,R),
					          (R,C,E,C,C));
end hauntedhouse;

with tools;

package body hauntedhouse is
   
   subtype Index is Positive range 1..5;
   package Ind_Generator is new tools.Random_Generator(Index);

   function GetRandPos return Position is
   begin
      return (Ind_Generator.GetRandom,Ind_Generator.GetRandom);
   end GetRandPos;

   function GetField(pos:Position) return Fields is
   begin
      return House(pos.x,pos.y);
   end GetField;

   function IsWall(pos: Position) return Boolean is
   begin
      return GetField(pos)=W;
   end IsWall;

   function IsCorrect(pos: Position) return Boolean is
   begin
      if (pos.x>=Index'First and then pos.x<=Index'Last and then 
          pos.y>=Index'First and then pos.y<=Index'Last) 
       then
         return not IsWall(pos);
      else
         return false;
      end if;
   end IsCorrect;

end hauntedhouse;

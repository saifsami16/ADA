generic
   type Elem is (<>);
package PSet is
   type Set is private;
   type TArray is array (Positive range <>) of Elem;

   function Make_Set (L: TArray) return Set; -- creates a Set from an array
   function Make_Set (E: Elem) return Set; -- creates a Set from an element
   function Decompose (S: Set) return TArray; -- turns a Set into an array

   function "+" (S, T: Set) return Set; -- union
   function "*" (S, T: Set) return Set; -- intersection
   function "<" (E: Elem; S: Set) return Boolean; -- inclusion
   function Contains (S, T: Set) return Boolean; -- checks if T contains S
   function Size (S: Set) return Natural; -- the size of a Set
   procedure print_Set(S: in Set); -- prints the set

private
   type Set is array (Elem) of Boolean;
end PSet;

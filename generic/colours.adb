with Ada.Text_IO; use Ada.Text_IO;
procedure Colours is
type Colour is (Red, Blue, Yellow);
package Colour_IO is new Enumeration_IO(Colour);
C: Colour;
begin
Colour_IO.Get( C );
Colour_IO.Put( C );
end Colours;

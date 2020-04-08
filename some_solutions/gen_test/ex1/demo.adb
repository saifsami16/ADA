with has_repetition, Ada.Text_IO;
use Ada.Text_IO;
procedure demo is
   type TInt is array (Integer range <>) of Integer;
   function my_rep is new has_repetition(Integer, Integer, TInt);

   v1: TInt := (1,1,2,4,5,650);
   v2: TInt := (1,2,3,4,5,6);
   v3: TInt(1..1); --:= (1);
   v4: TInt := (1,2, 3,3,3,56);
   v5: TInt := (1,2, 3,56,56);
begin
   v3(1):= 3;
   put_line(Boolean'Image(my_rep(v1)));
   put_line(Boolean'Image(my_rep(v2)));
   put_line(Boolean'Image(my_rep(v3)));
   put_line(Boolean'Image(my_rep(v4)));
   put_line(Boolean'Image(my_rep(v5)));
end demo;

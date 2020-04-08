with most_frequent3, Ada.Text_IO;
use Ada.Text_IO;
procedure demo_mf3 is
   type TInt is array (Integer range <>) of Integer;
   function my_mf is new most_frequent3(Integer, Integer, TInt);

   v1: TInt := (1,1,2,4,5,1,1,650);
   v2: TInt := (1,2,3,4,5,6);
   v3: TInt(1..1); --:= (1);
   v4: TInt := (1,1,2,1,2,1,3,3,3,56,1);
begin
   v3(1):= 3;
   put_line(Natural'Image(my_mf(v1)));
   put_line(Natural'Image(my_mf(v2)));
   put_line(Natural'Image(my_mf(v3)));
   put_line(Natural'Image(my_mf(v4)));

end demo_mf3;

with has_repetition, Ada.Text_IO;
use Ada.Text_IO;
procedure demo_hasrep is
   --type TInt is array (Integer range <>) of Integer;
   function my_rep is new has_repetition(Character, Positive, String);

   v1: String := "abdc";
   v2: String := "aa";
   v3: String(1..1):= (1=>'x');  --('x'); error
   v4: String := "abdcc";
   v5: String := "aabdc";
   v6: String(1..10) := "abbbdcedfg";
   v7: String := "";
   v8: String := "a";
   v9: String := "ab";
begin
  -- v3(1):= 'x';
   put_line(v1 & " " & Boolean'Image(my_rep(v1)));
   put_line(v2 & " " & Boolean'Image(my_rep(v2)));
   put_line(v3 & " " & Boolean'Image(my_rep(v3)));
   put_line(v4 & " " & Boolean'Image(my_rep(v4)));
   put_line(v5 & " " & Boolean'Image(my_rep(v5)));
   put_line(v6 & " " & Boolean'Image(my_rep(v6)));
   put_line(v7 & " " & Boolean'Image(my_rep(v7)));
   put_line(v8 & " " & Boolean'Image(my_rep(v8)));
   put_line(v9 & " " & Boolean'Image(my_rep(v9)));
end demo_hasrep;

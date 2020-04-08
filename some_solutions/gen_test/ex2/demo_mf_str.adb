with most_frequent, Ada.Text_IO;
use Ada.Text_IO;
procedure demo_mf_str is
   --type TInt is array (Integer range <>) of Integer;
   function my_rep is new most_frequent(Character, Positive, String);

   v1: String := "abdc";
   v2: String := "aa";
   v3: String(1..1):= (1=>'x');  --('x'); error
   v4: String := "acbdcccc";
   v5: String := "aaaaabdc";
   v6: String(1..17) := "aaabbbbbdcbebbdfg";
   v7: String := "";
   v8: String := "a";
   v9: String := "abccccc";
begin
  -- v3(1):= 'x';
   put_line(v1 & " " & my_rep(v1));
   put_line(v2 & " " & my_rep(v2));
   put_line(v3 & " " & my_rep(v3));
   put_line(v4 & " " & my_rep(v4));
   put_line(v5 & " " & my_rep(v5));
   put_line(v6 & " " & my_rep(v6));
   put_line(v7 & " " & my_rep(v7));
   put_line(v8 & " " & my_rep(v8));
   put_line(v9 & " " & my_rep(v9));
end demo_mf_str;

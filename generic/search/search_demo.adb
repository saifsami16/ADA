with Search, Ada.Text_IO;
use Ada.Text_IO;
procedure Search_Demo is

type TInt is array (Integer range <>) of Integer;

function is_negative (a: Integer) return Boolean is
begin
return (a<0);
end is_negative;

procedure my_search is new Search(Integer, Integer, TInt, is_negative);

a: TInt(1..5) := (1, 2, -3, 4, -5);
b: Boolean;
j: Integer;

begin
my_search(a, b, j);
if b then put_line("the first negative is:" & Integer'Image(a(j)));
else put_line("no negatives found");
end if;
end Search_Demo;

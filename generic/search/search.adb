procedure Search(t: TArray; b: out Boolean; j: out Index) is
begin
b:=False;
for i in reverse t'Range loop
if Prop(t(i)) then j:=i; b:=True;
end if;
end loop;
end Search;

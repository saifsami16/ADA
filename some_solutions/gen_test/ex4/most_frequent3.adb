with Ada.Text_IO; use Ada.Text_IO;
function most_frequent3( T: Vector) return Natural is
   type TArray is array (Index range <>) of Natural;

   a: TArray(T'Range):= (others =>0);
   max: Natural:=a(a'First);

   function Multiplicity(Pattern: Elem; j: index) return Natural is
      k: Natural := 0;
   begin
      for i in reverse T'First..Index'Pred(j) loop
        -- put_line(Natural'Image(a(i)));
         if Pattern = T(i) then a(i):=a(i)+1; return a(i);
         end if;
      end loop;
         return 1;
      end Multiplicity;

begin
   if T'Length > 1 then
   a(a'First):= 1;
   for i in Index'Succ(T'First) .. T'Last loop
     a(i):= Multiplicity(T(i), i);
   end loop;
   for i in a'Range loop
      if max < a(i) then max := a(i);
      end if;
      end loop;
      return max;
   else return 1;
   end if;
      end most_frequent3;

function most_frequent2( T: Vector) return Natural is
   type TArray is array (Index range <>) of Natural;

   a: TArray(T'Range):= (others =>1);
    max: Natural:=a(a'First);
   function Multiplicity(Pattern: Elem; j: index) return Natural is
      k: Natural := 0;
   begin
      for i in reverse T'First..j loop
         if Pattern = T(i) then k:=k+1;
            end if;
         end loop;
         return k;
      end Multiplicity;

      begin
         for i in T'Range loop
            a(i):= Multiplicity(T(i), i);
   end loop;
   for i in a'Range loop
      if max < a(i) then max := a(i);
      end if;
      end loop;
      return max;
      end most_frequent2;

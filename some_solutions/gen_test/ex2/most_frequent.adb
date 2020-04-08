function most_frequent( T: Vector) return Elem is

   function Multiplicity(Pattern: Elem) return Natural is
      k: Natural := 0;
   begin
      for i in T'Range loop
         if Pattern = T(i) then k:=k+1;
            end if;
         end loop;
         return k;
      end Multiplicity;
      p: Natural := 0;
      x: Elem;
      begin
         for i in T'Range loop
            if p< Multiplicity(T(i)) then x:=T(i); p:= Multiplicity(T(i));
            end if;
         end loop;
         return x;
      end most_frequent;

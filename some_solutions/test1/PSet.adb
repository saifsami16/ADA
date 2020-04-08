with Ada.Text_IO;
use Ada.Text_IO;

package body PSet is

   function Make_Set (L: TArray) return Set is
      S: Set := (others => False);
   begin
      For I in L'First..L'Last loop
         S(L(I)) := True;
      end loop;
      return S;
   end;

   function Make_Set (E: Elem) return Set is
     S: Set := (others => False);
   begin
      For I in S'First..S'Last loop
         if E = I then
            S(I) := True;
         end if;
      end loop;
      return S;
   end;

   function Size (S: Set) return Natural is
      SizeOfSet : Natural := 0;
   begin
      For I in S'First..S'Last loop
         if S(I) = True then
            SizeOfSet := SizeOfSet + 1;
         end if;
      end loop;
      return SizeOfSet;
   end;


   function Decompose (S: Set) return TArray is
      T: Tarray(1..Size(S));
      Counter : Natural := 0;
   begin
      for I in S'First..S'Last loop
         if S(I) = True then
            Counter := Counter + 1;
            T(Counter) := I;
         end if;

      end loop;
      return T;
   end;

   function "+" (S, T: Set) return Set is
      U: Set := (others => False);
   begin
      for I in S'First..S'Last loop
         if S(I) = True OR T(I) = True then
            U(I) := True;
         end if;
      end loop;
      return U;
   end;

   function "*" (S, T: Set) return Set is
      U: Set := (others => False);
   begin
      for I in S'First..S'Last loop
         if S(I) = True AND T(I) = True then
            U(I) := True;
         end if;
      end loop;
      return U;
   end;

   function "<" (E: Elem; S: Set) return Boolean is
   begin
      for I in S'First..S'Last loop
         if I = E then
            Return True;
         end if;
      end loop;
      return False;
   end;

   function Contains (S, T: Set) return Boolean is
      Check : Boolean := False;
   begin
      if size(S) = 0 then
         return True;
      else
         For I in S'Range loop
            if S(I) = true then
               if S(I) = T(I) then
                  Check := True;
               else
                  Return False;
               end if;
            end if;
         end loop;
         return Check;
      end if;
   end;

   procedure print_Set(S: in Set) is
   begin
      for I in S'First..S'Last loop
         if S(I) = True then
            Put_Line(Elem'Image(I));
         end if;
      end loop;
   end;

end PSet;

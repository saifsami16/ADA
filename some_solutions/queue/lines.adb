package body lines is

      procedure Push( V: in out Queue; E: in Elem ) is
      begin
          V.Pointer := V.Pointer + 1;
          V.Data(V.Pointer) := E;
      end;

   procedure Pop( V: in out Queue; E: out Elem ) is
      i: Integer;
      begin
          E := Top(V);
      i:= Integer'Succ(V.Data'First);
      for K in 1..size(v)-1 loop
         V.Data(i-1) :=V.Data(i);
         i:=i+1;
      end loop;
      V.Pointer := V.Pointer - 1;
      end;

      function Top( V: Queue ) return Elem is
      begin
          return V.Data(V.Data'First);
      end;

      function Is_Empty( V: Queue ) return Boolean is
      begin
          return V.Pointer = 0;
      end;

      function Is_Full( V: Queue ) return Boolean is
      begin
          return V.Pointer >= V.Max;
      end;

      function Size( V: Queue ) return Natural is
      begin
          return V.Pointer;
      end;

end lines;


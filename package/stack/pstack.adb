package body PStack is

      procedure Push( V: in out Stack; E: in Elem ) is
      begin
          V.Pointer := V.Pointer + 1;
          V.Data(V.Pointer) := E;
      end;

      procedure Pop( V: in out Stack; E: out Elem ) is
      begin
          E := Top(V);
          V.Pointer := V.Pointer - 1;
      end;

      function Top( V: Stack ) return Elem is
      begin
          return V.Data(V.Pointer);
      end;

      function Is_Empty( V: Stack ) return Boolean is
      begin
          return V.Pointer = 0;
      end;

      function Is_Full( V: Stack ) return Boolean is
      begin
          return V.Pointer >= V.Max;
      end;

      function Size( V: Stack ) return Natural is
      begin
          return V.Pointer;
      end;

end PStack;


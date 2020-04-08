package body Stacksgen is

 procedure Push( V: in out Stack; E: in Elem ) is
      begin
          V.Top := new Node'(E,V.Top);
          V.Size := V.Size + 1;
      end;

      procedure Pop( V: in out Stack; E: out Elem ) is
      begin
          E := Top(V);
          V.Top := V.Top.Next;
          V.Size := V.Size - 1;
      end;

      function Top( V: Stack ) return Elem is
      begin
          return V.Top.Data;
      exception
          when Constraint_Error => raise Empty_Stack;
      end;

      function Is_Empty( V: Stack ) return Boolean is
      begin
          return V.Size = 0;
      end;

      function Is_Full( V: Stack ) return Boolean is
      begin
          return False;
      end;

      function Size( V: Stack ) return Natural is
      begin
          return V.Size;
      end;
end Stacksgen;



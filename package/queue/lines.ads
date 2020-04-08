package Lines is

      subtype Elem is Integer;

      type Queue( Max: Positive ) is limited private;

      procedure Hiext( S: in out Queue; E: in Elem );
      procedure Lopop( S: in out Queue; E: out Elem );
      function Lov( S: Queue ) return Elem;
      function Is_Empty( S: Queue ) return Boolean;
      function Is_Full( S: Queue ) return Boolean;
      function Size( S: Queue ) return Natural;

private

      type TArray is array ( Integer range <> ) of Elem;
      type Queue( Max: Positive ) is record
                                       Adatok: TArray(1..Max);
                                       Putter, Getter: Positive := 1;
                                       Size: Natural := 0;
                                   end record;

end Lines;


package lines is

      subtype Elem is Integer;

      type Queue (Max: Positive) is limited private;

      procedure Push( V: in out Queue; E: in Elem );
      procedure Pop( V: in out Queue; E: out Elem );
      function Top( V: Queue ) return Elem;
      function Is_Empty( V: Queue ) return Boolean;
      function Is_Full( V: Queue ) return Boolean;
      function Size( V: Queue ) return Natural;

private
      type TArray is array( Integer range <> ) of Elem;
      type Queue(Max: Positive ) is record
                                        Data: TArray(1..Max);
                                        Pointer: Natural := 0;
                                    end record;
end lines;

generic 
      type Elem is private;
package Stacksgen is

      type Stack  is limited private;

      Empty_Stack : Exception;
      procedure Push( V: in out Stack; E: in Elem );
      procedure Pop( V: in out Stack; E: out Elem );
      function Top( V: Stack ) return Elem;
      function Is_Empty( V: Stack ) return Boolean;
      function Is_Full( V: Stack ) return Boolean;
      function Size( V: Stack ) return Natural;
   
private
    type Node;
      type Pointer is access Node;
      type Node is record
                      Data: Elem;
                      Next: Pointer := null;
                    end record;
      type Stack is record
                       Size: Natural := 0;
                       Top: Pointer := null;
                    end record;
end Stacksgen;


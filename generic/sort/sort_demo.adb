with Ada.Text_IO, sort;
use Ada.Text_IO;

procedure Sort_demo is    
	
    type TA is array (Character range <>) of Float;
    procedure Sort_incr is new Sort(Float,Character,TA);
    procedure Sort_dec is new Sort(Float,Character,TA,">");

    T: TA := (3.0,6.2,1.7,5.2,3.9);

begin
    Sort_incr(T);
    for I in T'Range loop
       Put_Line( Float'Image( T(I) ) );
    end loop;
    New_Line;

    Sort_dec(T);
    for I in T'Range loop
       Put_Line( Float'Image( T(I) ) );
    end loop;
end Sort_demo;

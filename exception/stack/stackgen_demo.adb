with Stacksgen, Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Stackgen_Demo is

   package IStacks is new Stacksgen(Integer);
   use IStacks;

Max: Integer;

    procedure Menu ( V: in out Stack ) is
        Parancs: Integer;

        procedure Insert( V: in out Stack ) is
             data: Integer;
        begin
             Put("What would you like to insert? "); Get(data);
             Push(V, data);
        exception
             when Full_Stack =>
                     Put_Line("Stack is full!");
        end Insert;

        procedure Delete( V: in out Stack ) is
             data: Integer;
        begin
             Pop(V, data);
             Put("The data extracted"); Put(data); New_Line;
        exception
             when Empty_Stack =>
                     Put_Line("Stack empty!");
        end Delete;

    begin
        loop
            Put_Line("Operations: push (1), pop (2), quit (0)");
            Get(Parancs);
            case Parancs is
                when 1 => Insert(V);
                when 2 => Delete(V);
                when 0 => exit;
                when others => null;
            end case;
        end loop;
    end Menu;

begin
    Put( "The size of the stack: " ); Get(Max);
    declare
        V: Stack(Max);
    begin
        Menu(V);
    end;
end Stackgen_Demo;

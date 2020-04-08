with Ada.Text_IO; use Ada.Text_IO;

procedure Pub is

   type Drinks is (Bier, Wine, Brandy);

    task Barman is
      entry Order( what: in Drinks);
    end Barman;

    task body Barman is
    begin
        for I in 1..20 loop
            accept Order ( what: in Drinks ) do
                Put_Line("The asked drink: " & Drinks'Image(what));
                case what is
                    when Bier => delay 1.0;
                    when Wine => delay 0.2;
                    when Brandy => delay 0.3;
                end case;
            end Order;
        end loop;
    end Barman;

    task type Fellow;

    task body Fellow is
        bier_drinking: Duration := 1.0;
    begin
        Barman.Order(Brandy);
        Put_Line("Let's start with a brandy.");
        delay 0.1;
        Barman.Order(Wine);
        Put_Line("The wine is good.");
        delay 0.3;
        loop
            Barman.Order(Bier);
            Put_Line("Nothing is better than a bier.");
            delay bier_drinking;
            bier_drinking := 2 * bier_drinking;
        end loop;
    end Fellow;

    type Fellow_Access is access Fellow;
    R: Fellow_Access;

begin

    for I in 1..5 loop
        delay 3.0;
        Put_Line("A fellow is here.");
        R := new Fellow;
    end loop;

end Pub;


with hauntedhouse, tools;
use hauntedhouse, tools;

procedure Ghosts is
	task Joe is
		entry Help;
	end Joe;

	task body Joe is
		helps : Natural := 0;	-- nr helps
	begin
		loop
			select
				when helps < 3 => accept Help do
					helps := helps + 1;
					OutPut.Puts("*************Joe " & Natural'Image(helps) & ". help.********************", 1);
				end Help;
				or terminate;
			end select;
			delay 3.0;
		end loop;
	end Joe;


	task Princess is
		entry Frightens(pos : Position; num : Positive);
	end Princess;

	task body Princess is
		current_pos : Position := (1, 3);
		life : Natural := 3;

		type Direction is (left, right, up, down);
		package Dir_Generator is new tools.Random_Generator(Direction);

		procedure Step is
			tmp_pos : Position;
			dir : Direction;
		begin
			loop
				tmp_pos := current_pos;
				dir := Dir_Generator.GetRandom;
				case dir is
					when up => tmp_pos.y := current_pos.y - 1;
					when right => tmp_pos.x := current_pos.x + 1;
					when down => tmp_pos.y := current_pos.y + 1;
					when left => tmp_pos.x := current_pos.x - 1;
				end case;
				exit when hauntedhouse.IsCorrect(tmp_pos);
			end loop;
			current_pos := tmp_pos;
		end step;

		procedure Startled(num : Positive) is	-- "begyullad"
		begin
			life := life - 1;	-- életerõt veszít
			Output.Puts("***Got scared_" & Positive'Image(num) & "! *** Lives: " & Natural'Image(life) & " ***", 1);
		end Startled;

		begin
			loop
				Output.Puts("Princess: (" & Positive'Image(current_pos.x) & "," & Positive'Image(current_pos.y) & ") position: " & Fields'Image(GetField(current_pos)), 1);
				select
					when GetField(current_pos) /= R => accept Frightens(pos : Position; num : Positive) do
						if pos = current_pos then
							if Joe'Callable then
								select
									Joe.Help;
								else
									Startled(num);
								end select;
							else
								Startled(num);
							end if;
						end if;
					end Frightens;
					or delay 1.0;
				end select;
				Step;
				exit when life < 1 or GetField(current_pos) = E;
			end loop;
			if life < 1 then
				Output.Puts("Scared to death.", 1);
			else
				Output.Puts("Exit!", 1);
			end if;
		exception when others => Output.Puts("Error with Princess.", 1);
		end Princess;

	type Dur_Ptr is access Duration;


	task type Ghost(my_num : Positive; wait : Dur_Ptr);

	task body Ghost is
		current_pos : Position;
	begin
		while Princess'Callable loop
			current_pos := hauntedhouse.GetRandPos;
			if Princess'Callable then
				Output.Puts("Ghost_" & Positive'Image(my_num) & ": (" & Positive'Image(current_pos.x) & "," & Positive'Image(current_pos.y) & ") Huh!!!", 1);	-- helyzetjelentés
				select
					Princess.Frightens(current_pos, my_num);
					or delay wait.all;
				end select;
			end if;
		end loop;
	exception when others => Output.Puts("Ghost_" & Positive'Image(my_num) & " ended.", 1);
	end Ghost;

	-- varázsló taszk típus
	task type Wizard(ghost_num : Positive; wait : access Duration);

	task body Wizard is
		type Ghost_Ptr is access Ghost;
		ptr : Ghost_Ptr;
		dur: Dur_Ptr;
	begin
		for I in 1 .. ghost_num loop
			delay wait.all;
			dur := new Duration'(Duration(I) * wait.all);
			ptr := new Ghost(I, dur);
		end loop;
	end Wizard;

	Count_Kartoffel : Wizard(9, new Duration'(0.2));
begin
	null;
exception
	when others => Output.Puts("Catched an exception in main.");
end Ghosts;

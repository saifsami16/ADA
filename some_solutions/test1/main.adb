with Ada.Text_IO;
use Ada.Text_IO;
with PSet;

procedure main is
   package test_pset is new PSet(Character);
   use test_pset;
   Set1: Set;
   Set2: Set;
   Set3: Set;
   Set4: Set;
   Set5: Set;
   Set1_2: Set;
   S1: TArray := "Hello";
   S2: Character := 'l';
   S3: TArray := "lo";
   S4: TArray := "";
   S5: TArray := "olleh";
   nb: Positive;

   begin

   Set1 := Make_Set(S1);
   nb := Size(Set1);
   declare
      test_decompose: TArray(1..nb);
      begin
      Set2 := Make_Set(S2);
      Set3 := Make_Set(S3);
      Set4 := Make_Set(S4);
      Set5 := Make_Set(S5);

      test_decompose := Decompose(Set1);
      Put("Print the array : ");
      For I in test_decompose'Range loop
         Put(test_decompose(I));
         Put(' ');
      end loop;
      New_Line;

      Set1_2 := Set1 + Set2;
      Put(" Size of the Set1 : ");
      Put_Line(Natural'Image(Size(Set1)));
      Put(" Size of the Set1_2 (after the Set1 + Set2) : ");
      Put_Line(Natural'Image(Size(Set1_2)));
      Put(" Contents of the Set1_2 (after the Set1 + Set2) : ");
      print_Set(Set1_2);

      New_Line;
      Set1_2 := Set1 * Set2 ;
      Put(" Size of the Set1_2 (after the Set1 * Set2) : ");
      Put_Line(Natural'Image(Size(Set1_2)));

      Set1_2 := Set1 * Set3 ;
      Put(" Contents of the Set1_2 (after the Set1 * Set3) : ");
      print_Set(Set1_2);
      New_Line;

      Put(" Is S2 included in Set1 : ");
      Put_Line(Boolean'Image(S2 < Set1));

      Put(" Is H included in Set1 : ");
      Put_Line(Boolean'Image('H' < Set1));

      Put(" Does Set1 Contain Set3 : ");
      Put_Line(Boolean'Image(Contains (Set3,Set1)));

      Put(" Does Set1 Contain Set4 : ");
      Put_Line(Boolean'Image(Contains (Set4,Set1)));

      Put(" Does Set1 Contain Set5 : ");
      Put_Line(Boolean'Image(Contains (Set5,Set1)));


   end;
end main;

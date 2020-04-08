with Ada.Numerics.Float_Random;
package Tools is

  task type Semafor( Max: Positive ) is
      entry P;
      entry V;
  end Semafor;

  protected Random is
     procedure Reset;
     entry Generate( F: out Float );
  private
     G: Ada.Numerics.Float_Random.Generator;
     Initial: Boolean := False;
  end Random;

end Tools;

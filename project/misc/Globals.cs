using Godot;
using System;

public partial class Globals : Node
{
  public static Globals Instance {get; private set;}
  
  public Vector2 Spawn = Vector2.Zero;

  public override void _Ready()
  {
    Instance = this;
  }
}

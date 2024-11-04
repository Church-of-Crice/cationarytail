using Godot;
using System;

public partial class PlayerCharacter : CharacterBody2D
{
  [Export] public float Speed = 80.0f;

  Vector2 PlayerInput;
  Vector2 PlayerMovement;
  private Node thoughtBubble;
  private bool disabled = false;

  public override void _Ready()
  {
    thoughtBubble = GetNode("ThoughtBubble");
    //GlobalPosition = Globals.Instance.Spawn;
    //Globals.Instance.Spawn = Vector2.Zero;
    //think_text("Meow", 2);
  }
  
  public void think_text(String text, float time = 2.0f)
  {
    thoughtBubble.Call("start_thought_text", text, time);
  }
  
  public void Disable()
  {
    disabled = true;
  }

  public void Enable()
  {
    disabled = false;
  }

  public override void _PhysicsProcess(double delta)
  {
    Move();
  }

  public void Move()
  {
    if (disabled){
      return;
    }
    PlayerInput = Input.GetVector("move_left", "move_right", "move_up", "move_down").Normalized();
    PlayerMovement = PlayerInput * Speed;
    Velocity = PlayerMovement;
    MoveAndSlide();
  }

}

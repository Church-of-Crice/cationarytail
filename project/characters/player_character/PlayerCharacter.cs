using Godot;
using System;

public partial class PlayerCharacter : CharacterBody2D
{
	[Export] public float Speed = 80.0f;

	Vector2 PlayerInput;
	Vector2 PlayerMovement;

	public override void _Ready()
	{
		GlobalPosition = Globals.Instance.Spawn;
		Globals.Instance.Spawn = Vector2.Zero;
	}

	public override void _PhysicsProcess(double delta)
	{
		Move();
	}

	public void Move()
	{
		PlayerInput = Input.GetVector("move_left", "move_right", "move_up", "move_down").Normalized();
		PlayerMovement = PlayerInput * Speed;
		Velocity = PlayerMovement;
		MoveAndSlide();
	}

}

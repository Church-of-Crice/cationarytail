using Godot;
using System;

public partial class PlayerCharacter : CharacterBody2D
{
	[Export] public float Speed = 80.0f;

	[Export] AnimatedSprite2D AnimSprite;

	Vector2 PlayerInput;
	Vector2 PlayerMovement;

	public override void _PhysicsProcess(double delta)
	{
		Move();
		AnimateSpriteToDirection();
	}

	public void Move()
	{
		PlayerInput = Input.GetVector("move_left", "move_right", "move_up", "move_down").Normalized();
		PlayerMovement = PlayerInput * Speed;
		Velocity = PlayerMovement;
		MoveAndSlide();
	}

	public void AnimateSpriteToDirection()
	{
		if(PlayerInput.X > 0)
		{
			AnimSprite.FlipH = false;
			// Play horizontal walk animation
		}
		else if(PlayerInput.X < 0)
		{
			AnimSprite.FlipH = true;
			// Play horizontal walk animation
		}
		else if(PlayerInput.Y > 0)
		{
			// Play vertical walk DOWN animation
		}
		else if(PlayerInput.Y < 0)
		{
			// Play vertical walk UP animation
		}
	}
}

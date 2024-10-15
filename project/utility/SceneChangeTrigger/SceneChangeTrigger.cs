using Godot;
using System;

public partial class SceneChangeTrigger : Area2D
{
	[Export] public PackedScene SceneToLoad;
	
	public void OnBodyEntered(Node2D body)
	{
		if(body.Name != "PlayerCharacter") return;
		
		GetTree().CallDeferred("change_scene_to_packed", SceneToLoad);
	}
}

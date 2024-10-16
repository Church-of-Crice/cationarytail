using Godot;
using System;

public partial class SceneChangeTrigger : Area2D
{
	[Export] public string ScenePath;
	[Export] public Vector2 SpawnLocationInScene = Vector2.Zero;
	
	public void OnBodyEntered(Node2D body)
	{
		if(body.Name != "PlayerCharacter") return;

		Globals.Instance.Spawn = SpawnLocationInScene;
		GetTree().CallDeferred("change_scene_to_file", ScenePath);
	}
}

extends Node2D


func _on_teleporter_body_entered(body: Node2D) -> void:
	$"../DoorExitSoundTeleporter".play()

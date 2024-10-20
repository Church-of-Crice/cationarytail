extends Area2D

#When player character body enters defined aera, a door exit sound will be played.


func _on_body_entered(body: Node2D) -> void:
	$DoorExitPlayer.play()

extends Node2D

var player: Node2D
var marker: Marker2D
#var child_scene_positions = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var parent_scene = get_tree().current_scene
	var vet_office = parent_scene.get_node("VetOffice")
	
	player = parent_scene.get_node("PlayerCharacter")
	marker = vet_office.get_node("Marker")
	
	#for child in get_children():
		#if child is Node2D:
			#child_scene_positions[child.name] = child.global_position

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_R:
			respawn()

func respawn() -> void:
	# SceneTransitionManager.change_scene_with_transition(SceneManager.VET_OFFICE, SceneManager.FADE_TRANSITION)
	
	if marker is Marker2D:
		if player is Node2D:
			player.global_position = marker.global_position
			print("Respawned.")
		else:
			printerr("Player is not a Node2D.")
	else:
		printerr("Marker2D is not a Marker2D.")

extends Node2D

var player: Node2D
var marker: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  var parent_scene = get_tree().current_scene
  var vet_office = parent_scene.get_node("VetOffice")

  player = parent_scene.get_node("PlayerCharacter")
  marker = vet_office.get_node("Marker2D")

func _input(event: InputEvent) -> void:
  if event is InputEventKey and event.pressed:
    if event.keycode == KEY_R:
      respawn()

func respawn() -> void:
  SceneTransitionManager.change_position_with_transition(player, marker, SceneManager.FADE_TRANSITION)

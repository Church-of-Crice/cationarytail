extends Control

@onready var back_button: Button = %BackButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	back_button.pressed.connect(_on_back_button_pressed)

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_packed.call_deferred(SceneManager.CHARACTER_CREATION_SCREEN)
	pass

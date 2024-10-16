extends Control

const CHARACTER_CREATION_SCREEN = preload("res://ui/screens/character_creation/character_creation_screen.tscn")

@onready var start_button: Button = %StartButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_button.pressed.connect(_on_start_button_pressed)

func _on_start_button_pressed():
	get_tree().change_scene_to_packed(CHARACTER_CREATION_SCREEN)

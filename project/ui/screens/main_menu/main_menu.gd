extends Control

@onready var start_button: TextureButton = %PlayButton
@onready var quit_button: TextureButton = %QuitButton
@onready var settings_button: TextureButton = %SettingsButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	start_button.pressed.connect(_on_start_button_pressed)
	# 	quit_button.pressed.connect(_on_quit_button_pressed)
	# settings_button.pressed.connect(_on_settings_button_pressed)
	

func _on_start_button_pressed() -> void:
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_packed.call_deferred(SceneManager.CHARACTER_CREATION_SCREEN)
	pass

func _on_quit_button_pressed() -> void:
	await get_tree().create_timer(1.0).timeout
	get_tree().quit()

func _on_settings_button_pressed() -> void:
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_packed.call_deferred(SceneManager.SETTINGS_SCREEN)
	pass
	

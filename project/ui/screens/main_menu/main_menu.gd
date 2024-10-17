extends Control

@onready var start_button: TextureButton = %PlayButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	start_button.pressed.connect(_on_start_button_pressed)

func _on_start_button_pressed() -> void:
	# Create a new Timer node dynamically
	var timer = Timer.new()
	timer.wait_time = 1.0  # Set the timer to 2 seconds
	timer.one_shot = true
	add_child(timer)  # Add the timer to the scene

	# Start the timer and wait for it to finish
	timer.start()
	await timer.timeout  # Pause execution until the timer times out

	# Continue with whatever comes after the pause
	print("1 seconds have passed")
	
	get_tree().change_scene_to_packed.call_deferred(SceneManager.CHARACTER_CREATION_SCREEN)
	pass

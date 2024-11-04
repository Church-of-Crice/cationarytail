extends TextureButton

var _audio_player: AudioStreamPlayer
var _correct_sound: AudioStream
var _original_scale: Vector2
var _original_color: Color

func _ready() -> void:
  # Create a new AudioStreamPlayer instance for click sound
  _audio_player = AudioStreamPlayer.new()
  add_child(_audio_player)
  
  # Preload the click sound file
  _correct_sound = load("res://sounds/button click sound.mp3")
  _audio_player.stream = _correct_sound
  
  # Connect signals
  pressed.connect(on_button_pressed)
  mouse_entered.connect(on_mouse_entered)
  mouse_exited.connect(on_mouse_exited)
  
  # Store the original scale and color
  _original_scale = scale
  _original_color = modulate

func on_button_pressed() -> void:
  _audio_player.play()
  # You can call deferred scene change here if you uncomment this line
  # get_tree().change_scene_to_packed.call_deferred(SceneManager.CHARACTER_CREATION_SCREEN)

func on_mouse_entered() -> void:
  # Make button bigger and change color
  scale = _original_scale * 1.1  # Scale the button up by 10%
  modulate = Color(1, 1, 1, 0.9)  # Change the button's color to white with 90% opacity

func on_mouse_exited() -> void:
  # Reset the button scale and color
  scale = _original_scale  # Reset the scale to original
  modulate = _original_color  # Reset the color to original

func _process(_delta: float) -> void:
  # No need to check and play the sound here anymore
  pass

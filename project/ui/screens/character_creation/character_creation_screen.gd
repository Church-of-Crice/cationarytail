extends Control

@onready var coat_left_button: TextureButton = %CoatLeftButton
@onready var coat_right_button: TextureButton = %CoatRightButton
@onready var collar_left_button: TextureButton = %CollarLeftButton
@onready var collar_right_button: TextureButton = %CollarRightButton
@onready var eyes_left_button: TextureButton = %EyesLeftButton
@onready var eyes_right_button: TextureButton = %EyesRightButton

@onready var start_button: TextureButton = %StartButton

@onready var player_character_appearance: CharacterAppearance = %PlayerCharacterAppearance

func _ready() -> void:
  
  coat_left_button.pressed.connect(_on_coat_left_button_pressed)
  coat_right_button.pressed.connect(_on_coat_right_button_pressed)
  collar_left_button.pressed.connect(_on_collar_left_button_pressed)
  collar_right_button.pressed.connect(_on_collar_right_button_pressed)
  eyes_left_button.pressed.connect(_on_eyes_left_button_pressed)
  eyes_right_button.pressed.connect(_on_eyes_right_button_pressed)
  start_button.pressed.connect(_on_start_button_pressed)

func _on_coat_left_button_pressed():
  UiSound.button_pressed.emit()
  player_character_appearance.set_body_to_previous()

func _on_coat_right_button_pressed():
  UiSound.button_pressed.emit()
  player_character_appearance.set_body_to_next()

func _on_collar_left_button_pressed():
  UiSound.button_pressed.emit()
  player_character_appearance.set_collar_to_previous()

func _on_collar_right_button_pressed():
  UiSound.button_pressed.emit()
  player_character_appearance.set_collar_to_next()

func _on_eyes_left_button_pressed():
  UiSound.button_pressed.emit()
  player_character_appearance.set_eyes_to_previous()

func _on_eyes_right_button_pressed():
  UiSound.button_pressed.emit()
  player_character_appearance.set_eyes_to_next()

func _on_start_button_pressed():
  UiSound.button_pressed.emit()
  SceneTransitionManager.change_scene_with_transition(SceneManager._03_0_FIRST_DAY_HOME_ADOPTED, SceneManager.FADE_TRANSITION)

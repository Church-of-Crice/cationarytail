extends Node

signal button_pressed

@export var ui_button_press_01: AudioStream

@onready var pressed_audio_stream_player: AudioStreamPlayer = %PressedAudioStreamPlayer

func _ready():
	button_pressed.connect(_on_button_pressed)

func _on_button_pressed():
	pressed_audio_stream_player.stream = ui_button_press_01
	pressed_audio_stream_player.play()

class_name PickNameOverlay extends CanvasLayer

signal done

@onready var done_button: Button = %DoneButton
@onready var line_edit: LineEdit = %LineEdit
@onready var audio_stream_player: AudioStreamPlayer = %AudioStreamPlayer

func _ready() -> void:
	visible = false
	done_button.pressed.connect(_on_done_button_pressed)

func _on_done_button_pressed():
	audio_stream_player.play()
	CharacterData.player_name = line_edit.text
	done.emit()

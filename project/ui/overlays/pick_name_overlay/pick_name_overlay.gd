class_name PickNameOverlay extends CanvasLayer

signal done

@onready var done_button: Button = %DoneButton
@onready var line_edit: LineEdit = %LineEdit

func _ready() -> void:
	visible = false
	done_button.pressed.connect(_on_done_button_pressed)

func _on_done_button_pressed():
	CharacterData.player_name = line_edit.text
	done.emit()

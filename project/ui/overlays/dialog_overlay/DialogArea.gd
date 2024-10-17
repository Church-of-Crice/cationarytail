extends Area2D

@export var text_key: String = ""
@export var character: Character
@export var dialog_sequence: DialogSequence

var area_active: bool = false

func _unhandled_input(event):
		if area_active and event.is_action_pressed("ui_accept"):
			DialogManager.start_dialog_sequence.emit(dialog_sequence)
			get_viewport().set_input_as_handled()

func _on_area_entered(area: Area2D) -> void:
	area_active = true

func _on_area_exited(area: Area2D) -> void:
	area_active = false

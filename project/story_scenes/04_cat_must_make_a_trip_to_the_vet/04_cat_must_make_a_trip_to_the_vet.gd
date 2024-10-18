extends Node2D

@export var start_dialog_sequence: DialogSequence

func _ready() -> void:
	DialogManager.start_dialog_sequence.emit(start_dialog_sequence)

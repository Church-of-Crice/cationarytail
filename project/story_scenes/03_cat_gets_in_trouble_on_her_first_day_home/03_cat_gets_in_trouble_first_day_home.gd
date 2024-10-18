extends Node2D

@export var start_dialog_sequence: DialogSequence

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogManager.start_dialog_sequence.emit(start_dialog_sequence)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

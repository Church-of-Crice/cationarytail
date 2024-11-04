class_name ShelterClerk
extends Node2D

@onready var dialog_area: DialogArea = %DialogArea

func get_current_dialog():
  return dialog_area.dialog_sequence

func set_dialog(sequence: DialogSequence):
  dialog_area.dialog_sequence = sequence
  dialog_area.has_completed_dialog = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  pass

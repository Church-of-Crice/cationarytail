class_name DialogArea
extends Area2D

@export var text_key: String = ""
@export var character: Character
@export var dialog_sequence: DialogSequence
@export var one_time_only := false

var area_active: bool = false
var has_completed_dialog := false

func _unhandled_input(event):
    if has_completed_dialog and one_time_only:
      return
    if area_active and event.is_action_pressed("ui_accept"):
      DialogManager.start_dialog_sequence.emit(dialog_sequence)
      get_viewport().set_input_as_handled()
      await dialog_sequence.finished
      has_completed_dialog = true

func _on_area_entered(area: Area2D) -> void:
  area_active = true

func _on_area_exited(area: Area2D) -> void:
  area_active = false

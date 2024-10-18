class_name GooglyEyes
extends Area2D

@export var text_key: String = ""
@export var character: Character
@export var dialog_sequence: DialogSequence

var area_active: bool = false

func _ready():
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)

func _unhandled_input(event):
		if area_active and event.is_action_pressed("ui_accept"):
			DialogManager.start_dialog_sequence.emit(dialog_sequence)
			get_viewport().set_input_as_handled()
			await dialog_sequence.finished
			SceneTransitionManager.change_scene_with_transition(SceneManager._04_CAT_MUST_MAKE_A_TRIP_TO_THE_VET, SceneManager.FADE_TRANSITION)

func _on_area_entered(area: Area2D) -> void:
	area_active = true

func _on_area_exited(area: Area2D) -> void:
	area_active = false

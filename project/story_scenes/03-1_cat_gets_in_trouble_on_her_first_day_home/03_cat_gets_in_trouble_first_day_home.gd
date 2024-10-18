extends Node2D

@export var start_dialog_sequence: DialogSequence
@onready var googley_eyes: ThoughtBubbleInteractable = %GoogleyEyes

func _ready() -> void:
	DialogManager.start_dialog_sequence.emit(start_dialog_sequence)
	await googley_eyes.interacted
	await get_tree().create_timer(2).timeout
	SceneTransitionManager.change_scene_with_transition(SceneManager._04_CAT_MUST_MAKE_A_TRIP_TO_THE_VET, SceneManager.FADE_TRANSITION)

extends Node2D

@export var start_dialog_sequence: DialogSequence
@export var dialog_after_cat_gets_sick: DialogSequence
@export var dialog_leaving_house: DialogSequence

@onready var googley_eyes: ThoughtBubbleInteractable = %GoogleyEyes

func _ready() -> void:
	DialogManager.start_dialog_sequence.emit(start_dialog_sequence)
	await googley_eyes.interacted
	googley_eyes.visible = false
	# todo: Lucretia approaches cat.
	DialogManager.start_dialog_sequence.emit(dialog_after_cat_gets_sick)
	await dialog_after_cat_gets_sick.finished
	# Todo: Lucretia puts cat in carrier
	await get_tree().create_timer(0.1).timeout
	DialogManager.start_dialog_sequence.emit(dialog_leaving_house)
	await dialog_leaving_house.finished
	# Todo: Lucretia carries cat carrier out of House of Adopter
	SceneTransitionManager.change_scene_with_transition(SceneManager._04_0_CAT_MUST_MAKE_A_TRIP_TO_THE_VET, SceneManager.FADE_TRANSITION)

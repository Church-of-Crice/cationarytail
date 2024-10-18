extends Node2D

@export var start_dialog_sequence: DialogSequence
@export var after_choosing_name_dialog: DialogSequence

var next_scene: PackedScene = SceneManager._03_1_CAT_GETS_IN_TROUBLE_FIRST_DAY_HOME

@onready var pick_name_overlay: CanvasLayer = %PickNameOverlay

func _ready() -> void:
	# Add opening animation.
	# await the end of the opening animation
	await start_opening_dialog()
	await pick_name()
	await continue_scene()
	end_scene()
	
func start_opening_dialog():
	DialogManager.start_dialog_sequence.emit(start_dialog_sequence)
	await start_dialog_sequence.finished

func pick_name():
	pick_name_overlay.show()
	await get_tree().create_timer(1).timeout
	pick_name_overlay.hide()

func continue_scene():
	DialogManager.start_dialog_sequence.emit(after_choosing_name_dialog)
	await after_choosing_name_dialog.finished

func end_scene():
	SceneTransitionManager.change_scene_with_transition(next_scene, SceneManager.FADE_TRANSITION)

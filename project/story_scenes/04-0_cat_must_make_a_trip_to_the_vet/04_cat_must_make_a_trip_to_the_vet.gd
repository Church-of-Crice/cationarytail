extends Node2D

@export var start_dialog_sequence: DialogSequence
@export var next_scene: PackedScene

func _ready() -> void:
	DialogManager.start_dialog_sequence.emit(start_dialog_sequence)
	await start_dialog_sequence.finished
	# todo: go dark and hear operation sounds.
	# > Cut to black.
	#> Surgery is performed.
	#> A foreign object is found: Googly Eyes

	SceneTransitionManager.change_scene_with_transition(next_scene, SceneManager.FADE_TRANSITION)

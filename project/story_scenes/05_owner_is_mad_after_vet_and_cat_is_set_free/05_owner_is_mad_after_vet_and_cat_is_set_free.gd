extends Node2D

@export var start_dialog_sequence: DialogSequence
@export var end_dialog_sequence: DialogSequence
@export var next_scene: PackedScene

func _ready() -> void:
	# todo: > Lucretia carries cat carrier into house
	#> Lucretia sets down cat carrier
	#> Player Cat exits cat carrier
	DialogManager.start_dialog_sequence.emit(start_dialog_sequence)
	await start_dialog_sequence.finished
	await get_tree().create_timer(0.1)
	# todo: > Lucretia angrily stomps over to door, swings it open
	DialogManager.start_dialog_sequence.emit(end_dialog_sequence)
	await end_dialog_sequence.finished

	SceneTransitionManager.change_scene_with_transition(next_scene, SceneManager.FADE_TRANSITION)

extends CanvasLayer

signal start_dialog_sequence(sequence: DialogSequence)

var current_sequence: DialogSequence
var in_progress: bool = false

@onready var dialog_overlay: DialogOverlay = %DialogOverlay

func _ready() -> void:
	process_mode = PROCESS_MODE_ALWAYS
	hide()
	start_dialog_sequence.connect(_on_start_dialog_sequence)

func start_dialog(sequence: DialogSequence):
	show()
	in_progress = true
	current_sequence = sequence
	get_tree().paused = true
	next()

func next():
	var event: DialogEvent = current_sequence.get_next()
	if event:
		dialog_overlay.dialog_event = event
	else:
		finish_dialog()

func _on_sequence_done():
	finish_dialog()

func _unhandled_input(event: InputEvent) -> void:
	if in_progress:
		if event.is_action_pressed("ui_accept"):
			next()
			get_viewport().set_input_as_handled()

func _on_start_dialog_sequence(sequence: DialogSequence):
	start_dialog(sequence)

func finish_dialog():
	in_progress = false
	get_tree().paused = false
	hide()

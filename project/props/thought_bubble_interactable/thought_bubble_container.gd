class_name ThoughtBubbleContainer extends VBoxContainer

## The text to show in the thought bubble
@export var text: String:
	set(val):
		text = val
		if label:
			label.text = text
		if not text:
			visible = false
		else:
			visible = true

## The number of seconds the thought bubble should remain visible
@export var thought_persist_time: float = 5.0

@onready var label: Label = %Label
@onready var timer: Timer = Timer.new()

func _ready() -> void:
	label.text = text
	add_child(timer)
	timer.one_shot = true

func _on_thought_started():
	pass

func start_thought_text(thought_text: String, time: float = thought_persist_time):
	text = thought_text
	timer.stop()
	timer.wait_time = time
	timer.start()
	await timer.timeout
	reset()

func reset():
	text = ""

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

## The image to show in the thought bubble
@export var image: Texture2D:
	set(val):
		image = val
		if thought_image:
			thought_image.texture = image
		if not image:
			visible = false
		else:
			visible = true

## The number of seconds the thought bubble should remain visible
@export var thought_persist_time: float = 5.0

@onready var label: Label = %Label
@onready var thought_image: TextureRect = %ThoughtImage
@onready var timer: Timer = Timer.new()


func _ready() -> void:
	visible = false
	label.text = text
	add_child(timer)
	timer.one_shot = true

func _on_thought_started():
	pass

func start_thought_text(thought_text: String, time: float = thought_persist_time):
	image = null
	text = thought_text
	timer.stop()
	timer.wait_time = time
	timer.start()
	await timer.timeout
	reset()

func start_thought_image(texture: Texture2D, time: float):
	text = ""
	image = texture
	timer.stop()
	timer.wait_time = time
	timer.start()
	await timer.timeout
	reset()

func reset():
	text = ""
	image = null

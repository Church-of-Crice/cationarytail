class_name DialogOverlay
extends Control

@export var dialog_event: DialogEvent:
	set(val):
		dialog_event = val
		if not dialog_event:
			return
		if is_instance_valid(dialog_text):
			dialog_text.text = dialog_event.text
		if is_instance_valid(character_portrait) and dialog_event.character.portrait:
			character_portrait.texture = dialog_event.character.portrait
		
@onready var character_portrait: TextureRect = %CharacterPortrait
@onready var dialog_text: Label = %DialogText


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dialog_event = dialog_event
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

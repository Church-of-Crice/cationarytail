class_name ThoughtBubbleInteractable
extends Area2D

signal interacted

## Text to help the developer determine the thought_text and texture
@export var description: String

## What shows in the thought bubble
@export var thought_text: String

## The image of the object world sprite
@export var texture: Texture2D

var area_active: bool = false
var player_area: Area2D
@onready var sprite_2d: Sprite2D = %Sprite2D

func _ready():
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)
	if texture:
		sprite_2d.texture = texture

func _unhandled_input(event):
		if area_active and event.is_action_pressed("ui_accept"):
			player_area.think_text(thought_text)
			get_viewport().set_input_as_handled()
			interacted.emit()

func _on_area_entered(area: Area2D) -> void:
	area_active = true
	player_area = area

func _on_area_exited(area: Area2D) -> void:
	area_active = false
	player_area = area

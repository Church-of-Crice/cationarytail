class_name DeadlyItemInteractable extends Node2D

@export var deadly_interactable_data: DeadlyInteractableData

signal interacted

## Text to help the developer determine the thought_text and texture
@export var description: String

## What shows in the thought bubble
@export var thought_text: String

## The image of the object world sprite
@export var texture: Texture2D

## The distance from which the item should be detected.
@export var detectable_range: float = 60.0

## How long to show the thought bubble
@export var show_thought_time: float = 2.0

## How much time between when the thought is shown
@export var thought_interval: float = 10.0

var area_active: bool = false
var player_area: Area2D

@onready var sprite_2d: Sprite2D = %Sprite2D
@onready var thought_bubble_interactable: ThoughtBubbleInteractable = %ThoughtBubbleInteractable
@onready var detectable_deadly_area_2d: DetectableDeadlyArea = %DetectableDeadlyArea2D
@onready var collision_shape_2d: CollisionShape2D = %CollisionShape2D



func _ready():
	thought_bubble_interactable.interacted.connect(func(): interacted.emit())
	detectable_deadly_area_2d.deadly_world_sprite = texture
	collision_shape_2d.shape.radius = detectable_range
	show_thought_time
	thought_interval
	if texture:
		sprite_2d.texture = texture

class_name DeadlyItemInteractable extends Node2D

@export var deadly_interactable_data: DeadlyInteractableData

signal interacted
signal death_end

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

## The type of death
@export var death_type: CharacterData.DeathType

var area_active: bool = false
var player_area: Area2D

@onready var sprite_2d: Sprite2D = %Sprite2D
@onready var thought_bubble_interactable: ThoughtBubbleInteractable = %ThoughtBubbleInteractable
@onready var detectable_deadly_area_2d: DetectableDeadlyArea = %DetectableDeadlyArea2D
@onready var collision_shape_2d: CollisionShape2D = %CollisionShape2D

func _ready():
	_setup_thought_bubble()
	death_end.connect(_on_death_end)
	detectable_deadly_area_2d.deadly_world_sprite = texture
	collision_shape_2d.shape.radius = detectable_range
	detectable_deadly_area_2d.show_for = show_thought_time
	detectable_deadly_area_2d.interval_time = thought_interval
	if texture:
		sprite_2d.texture = texture

func _setup_thought_bubble():
	thought_bubble_interactable.interacted.connect(_on_interact)
	thought_bubble_interactable.description = description
	thought_bubble_interactable.thought_text = thought_text

func _on_interact():
	
	if CharacterData.has_already_died_by(death_type):
		# TODO: Tell the player.
		print("Player has already died by %s" % death_type)
		return
	else:
		interacted.emit()

# Handle all of the generic death actions.
func _on_death_end():
	_add_death()
	#_respawn()

func _add_death() -> void:
	CharacterData.player_died.emit(death_type)
	thought_bubble_interactable.disable()

#func _respawn() -> void:
	#CharacterData.player_died
	##GameWorld.respawn()

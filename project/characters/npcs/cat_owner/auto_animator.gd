## Reads CharacterBody2D velocity each frame and if the correct animation is not playing, plays the correct animation.
## Animations include: idle and walk for up, down, left, and right. Eg. "walk_left"
class_name AutoAnimator
extends Node

@export var character_body_2d: CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D

var facing_direction := "down"

func _ready() -> void:
  if not character_body_2d:
    character_body_2d = get_parent()

func _process(delta: float) -> void:
    if character_body_2d.velocity.length() > 0:
        update_facing_direction()
    
    if character_body_2d.velocity == Vector2.ZERO:
        _play_idle_animation()
    else:
        _play_walk_animation()

func update_facing_direction() -> void:
    var velocity = character_body_2d.velocity
    if abs(velocity.x) > abs(velocity.y):
        facing_direction = "right" if velocity.x > 0 else "left"
    else:
        facing_direction = "down" if velocity.y > 0 else "up"

func _play_idle_animation() -> void:
    animated_sprite_2d.play("idle_" + facing_direction)

func _play_walk_animation() -> void:
    animated_sprite_2d.play("walk_" + facing_direction)

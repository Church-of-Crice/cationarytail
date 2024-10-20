class_name Teleporter extends Area2D

@export var destination: PackedScene
@onready var arrow_indicator: Sprite2D = %ArrowIndicator

func _ready() -> void:
	arrow_indicator.visible = false
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: CharacterBody2D):
	SceneTransitionManager.change_scene_with_transition(destination, SceneManager.FADE_TRANSITION)

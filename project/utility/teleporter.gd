class_name Teleporter extends Area2D

@export var destination: PackedScene

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: CharacterBody2D):
	SceneTransitionManager.change_scene_with_transition(destination, SceneManager.FADE_TRANSITION)

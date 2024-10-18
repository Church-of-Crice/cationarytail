class_name Teleporter extends Area2D

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: CharacterBody2D):
	SceneTransitionManager.change_scene_with_transition(SceneManager._03_0_FIRST_DAY_HOME_ADOPTED, SceneManager.FADE_TRANSITION)

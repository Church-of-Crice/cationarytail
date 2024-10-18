class_name Teleporter extends Area2D

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: CharacterBody2D):
	get_tree().change_scene_to_packed(SceneManager._03_CAT_GETS_IN_TROUBLE_FIRST_DAY_HOME)

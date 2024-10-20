class_name BaseDeathHandler
extends Node

@onready var deadly_interactable: DeadlyItemInteractable = get_parent()

func _ready() -> void:
	deadly_interactable.interacted.connect(_on_interact)

func _on_interact() -> void:
	print("Interacting...")
	on_interact()

func 	_on_death_start() -> void:
	print("Death starting...")
	on_death_start()

func _on_death_end() -> void:
	print("Death ending...")
	deadly_interactable.death_end.emit()

func on_interact() -> void:
	print("Default on_interact.")
	on_death_start()

func on_death_start() -> void:
	print("Default on_death_start.")
	_on_death_end()

class_name BaseDeathHandler
extends Node

@onready var deadly_interactable: DeadlyItemInteractable = get_parent()

func _ready() -> void:
	deadly_interactable.interacted.connect(_on_interact)

func _on_interact() -> void:
	print("Interacting...")
	on_interact()

# Call this to start the death.
func _on_death_start() -> void:
	print("Death starting...")
	on_death_start()

# Call this once the death has finished.
func _on_death_end() -> void:
	print("Death ending...")
	deadly_interactable.death_end.emit()

# This is called when the player has interacted with the object.
# This should only be overridden if you need to start a timer, etc. And that
# timer is responsible for calling `on_death_start`.
func on_interact() -> void:
	print("Default on_interact.")
	on_death_start()

# This is called when the death has started.
# This should play any sounds or animations.
func on_death_start() -> void:
	print("Default on_death_start.")
	_on_death_end()

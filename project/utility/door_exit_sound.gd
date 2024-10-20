extends AudioStreamPlayer2D

@onready var doorway = $".."

func _ready():
	doorway.interacted.connect(_on_interacted)

func _on_interacted() -> void:
	play()

extends AudioStreamPlayer2D

@onready var doorway: Teleporter = $".."

func _ready():
	doorway.body_entered.connect(_on_teleporter_body_entered)

func _on_teleporter_body_entered(body: Node2D) -> void:
	play()

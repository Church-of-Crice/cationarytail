extends Area2D

@export var text_key: String = ""

var area_active: bool = false

func _input(event):
		if area_active and event.is_action_pressed("ui_accept"):
				SignalBus.emit_signal("display_dialog", text_key)

func _on_area_entered(area: Area2D) -> void:
	area_active = true

func _on_area_exited(area: Area2D) -> void:
	area_active = false

## The area in which a deadly interaction is detectable
class_name DetectableDeadlyArea extends Area2D

var area_active := true
var think_area: Area2D
var deadly_world_sprite: Texture2D
var show_for: float
var interval_time: float
var detectable = true

@onready var deadly_interactable: DeadlyItemInteractable = $".."
@onready var deadly_thought_interval_timer: Timer = %DeadlyThoughtIntervalTimer

func _ready():
	deadly_interactable.interacted.connect(_on_interactable_interacted)
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)
	deadly_thought_interval_timer.timeout.connect(_on_interval_timer_timeout)

func _on_interactable_interacted():
	detectable = false
	deadly_thought_interval_timer.stop()
	if area_entered.is_connected(_on_area_entered):
		area_entered.disconnect(_on_area_entered)
	if area_exited.is_connected(_on_area_exited):
		area_exited.disconnect(_on_area_exited)

func _on_interval_timer_timeout():
	if think_area:
		think_area.think_image(deadly_world_sprite, show_for)

func _on_area_entered(area: Area2D) -> void:
	area_active = true
	think_area = area
	area.think_image(deadly_world_sprite, show_for)
	deadly_thought_interval_timer.start(interval_time)

func _on_area_exited(area: Area2D) -> void:
	area_active = false
	think_area = null
	deadly_thought_interval_timer.stop()

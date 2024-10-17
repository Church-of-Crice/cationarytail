class_name DialogSequence
extends Resource

@export var events: Array[DialogEvent]

var current_index = 0

func get_next():
	if current_index >= events.size():
		current_index = 0
		return null
	var event = events[current_index]
	current_index += 1
	return event

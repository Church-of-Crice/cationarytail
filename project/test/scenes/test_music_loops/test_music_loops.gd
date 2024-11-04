extends Node2D

@onready var adventure_time_crushed_loop_: AudioStreamPlayer = %"AdventureTime[crushedLoop]"

func _ready() -> void:
	var song_length = adventure_time_crushed_loop_.stream.get_length()
	print(song_length)
	adventure_time_crushed_loop_.play(song_length - 10)

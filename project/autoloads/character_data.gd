extends Node

signal player_died(death_type: DeathType)

enum DeathType {
	IDLE,
	RABIES,
	STEAM_ROLLER,
}

var ways_died: Dictionary = {}

var appearance: CharacterAppearanceData = CharacterAppearanceData.new()

func _ready() -> void:
	player_died.connect(_on_player_died)

func _on_player_died(death_type: DeathType) -> void:
	ways_died[death_type] = true

func has_already_died_by(death_type: DeathType) -> bool:
	return ways_died.has(death_type)

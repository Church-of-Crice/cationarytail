class_name CharacterAppearance
extends Node2D

@export var data: CharacterAppearanceData = CharacterData.appearance

@onready var body_type: CharacterAppearanceData.BodyType:
	set(val):
		data.body_type = val
		if body:
			body.texture = data.body_textures.get(body_type, null)
		if body_animated_sprite_2d:
			body_animated_sprite_2d.body_type = body_type
		
	get:
		return data.body_type

@onready var collar_type: CharacterAppearanceData.CollarType:
	set(val):
		data.collar_type = val
		if collar:
			collar.texture = data.collar_textures.get(collar_type, null)
	get:
		return data.collar_type
@onready var eye_type: CharacterAppearanceData.EyeType:
	set(val):
		data.eye_type = val
		if eyes:
			eyes.texture = data.eye_textures.get(eye_type, null)
	get:
		return data.eye_type

@onready var body: Sprite2D = $Body
@onready var collar: Sprite2D = $Collar
@onready var eyes: Sprite2D = $Eyes
@onready var body_animated_sprite_2d: BodyAnimatedSprite2D = %BodyAnimatedSprite2D

var velocity: Vector2:
	set(val):
		velocity = val
		if body_animated_sprite_2d:
			body_animated_sprite_2d.velocity = velocity

func _init() -> void:
	data = CharacterData.appearance

func _physics_process(delta: float) -> void:
	var player_character = $".."
	if player_character is CharacterBody2D:
		velocity = player_character.velocity

func _ready():
	data = CharacterData.appearance
	body.texture = data.body_textures.get(body_type, null)
	collar.texture = data.collar_textures.get(collar_type, null)
	eyes.texture = data.eye_textures.get(eye_type, null)

func set_body_to_next():
	body_type = (data.body_type + 1) % data.body_count

func set_body_to_previous():
	body_type = (data.body_type - 1 + data.body_count) % data.body_count

func set_collar_to_next():
	collar_type = (data.collar_type + 1) % data.collar_count

func set_collar_to_previous():
	collar_type = (data.collar_type - 1 + data.collar_count) % data.collar_count

func set_eyes_to_next():
	eye_type = (data.eye_type + 1) % data.eyes_count

func set_eyes_to_previous():
	eye_type = (data.eye_type - 1 + data.eyes_count) % data.eyes_count

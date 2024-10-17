class_name BodyAnimatedSprite2D
extends AnimatedSprite2D

var sitTimer = 0

const BLACK_CAT_ANIMATIONS = preload("res://characters/player_character/art/animations/black cat walk1.res")
const BROWN_CAT_ANIMATIONS = preload("res://characters/player_character/art/animations/brown cat walk1.res")
const CALICO_CAT_ANIMATIONS = preload("res://characters/player_character/art/animations/calico cat walk1.res")
const GREY_CAT_ANIMATIONS = preload("res://characters/player_character/art/animations/grey cat walk1.res")
const ORANGE_CAT_ANIMATIONS = preload("res://characters/player_character/art/animations/orange cat walk1.res")
const RUSSIAN_BLUE_ANIMATIONS = preload("res://characters/player_character/art/animations/russian blue walk1.res")
const SIAMESE_CAT_ANIMATIONS = preload("res://characters/player_character/art/animations/siamese cat walk1.res")
const WHITE_CAT_ANIMATIONS = preload("res://characters/player_character/art/animations/white cat walk1.res")

const BODY_TYPE_ANIMATIONS = {
	CharacterAppearanceData.BodyType.BLACK: BLACK_CAT_ANIMATIONS,
	CharacterAppearanceData.BodyType.BROWN: BROWN_CAT_ANIMATIONS,
	CharacterAppearanceData.BodyType.CALICO: CALICO_CAT_ANIMATIONS,
	CharacterAppearanceData.BodyType.GREY_WITH_WHITE: GREY_CAT_ANIMATIONS,
	CharacterAppearanceData.BodyType.ORANGE: ORANGE_CAT_ANIMATIONS,
	CharacterAppearanceData.BodyType.RUSSIAN_BLUE: RUSSIAN_BLUE_ANIMATIONS,
	CharacterAppearanceData.BodyType.SIAMESE: SIAMESE_CAT_ANIMATIONS,
	CharacterAppearanceData.BodyType.WHITE: WHITE_CAT_ANIMATIONS
}

var velocity: Vector2:
	set(val):
		velocity = val

@onready var body_type: CharacterAppearanceData.BodyType:
	set(val):
		body_type = val
		sprite_frames = BODY_TYPE_ANIMATIONS.get(val, null)

func _ready() -> void:
	var val = CharacterData.appearance.body_type
	sprite_frames = BODY_TYPE_ANIMATIONS.get(val, null)

func _physics_process(delta: float) -> void:
	if velocity.length() > 0:
		play("walk")
		sitTimer = 0
	else:
		if sitTimer >= 100:
			play("sit")
		else:
			play("walk", 0.0)
			sitTimer += 1

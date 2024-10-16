@tool
extends Node2D

const BLACK_BODY = preload("res://characters/player_character/art/black body.png")
const BROWN_BODY = preload("res://characters/player_character/art/brown body.png")
const CALICO_BODY = preload("res://characters/player_character/art/calico body.png")
const GREY_WITH_WHITE_BODY = preload("res://characters/player_character/art/grey with white body.png")
const ORANGE_BODY = preload("res://characters/player_character/art/orange body.png")
const RUSSIAN_BLUE_BODY = preload("res://characters/player_character/art/russian blue body.png")
const SIAMESE_BODY = preload("res://characters/player_character/art/siamese body.png")
const WHITE_BODY = preload("res://characters/player_character/art/white body.png")

const BLACK_COLLAR = preload("res://characters/player_character/art/black collar.png")
const BLUE_COLLAR = preload("res://characters/player_character/art/blue collar.png")
const GREEN_COLLAR = preload("res://characters/player_character/art/green collar.png")
const LIGHT_BLUE_COLLAR = preload("res://characters/player_character/art/light blue collar.png")
const ORANGE_COLLAR = preload("res://characters/player_character/art/orange collar.png")
const PINK_COLLAR = preload("res://characters/player_character/art/pink collar.png")
const PURPLE_COLLAR = preload("res://characters/player_character/art/purple collar.png")
const RED_COLLAR = preload("res://characters/player_character/art/red collar.png")

const BLUE_EYES = preload("res://characters/player_character/art/blue eyes.png")
const DARK_GREEN_EYES = preload("res://characters/player_character/art/dark green eyes.png")
const GREEN_EYES = preload("res://characters/player_character/art/green eyes.png")
const ORANGE_EYES = preload("res://characters/player_character/art/orange eyes.png")
const PALE_EYES = preload("res://characters/player_character/art/pale eyes.png")
const PURPLE_EYES = preload("res://characters/player_character/art/purple eyes.png")
const RED_EYES = preload("res://characters/player_character/art/red eyes.png")
const YELLOW_EYES = preload("res://characters/player_character/art/yellow eyes.png")

enum BodyType {
    BLACK,
    BROWN,
    CALICO,
    GREY_WITH_WHITE,
    ORANGE,
    RUSSIAN_BLUE,
    SIAMESE,
    WHITE
}

enum CollarType {
    BLACK,
    BLUE,
    GREEN,
    LIGHT_BLUE,
    ORANGE,
    PINK,
    PURPLE,
    RED
}

enum EyeType {
    BLUE,
    DARK_GREEN,
    GREEN,
    ORANGE,
    PALE,
    PURPLE,
    RED,
    YELLOW
}

@export var body_type: BodyType:
    set(val):
        body_type = val
        if body:
            body.texture = body_textures.get(body_type, null)

@export var collar_type: CollarType:
    set(val):
        collar_type = val
        if collar:
            collar.texture = collar_textures.get(collar_type, null)

@export var eye_type: EyeType:
    set(val):
        eye_type = val
        if eyes:
            eyes.texture = eye_textures.get(eye_type, null)

@onready var body: Sprite2D = $Body
@onready var collar: Sprite2D = $Collar
@onready var eyes: Sprite2D = $Eyes

var body_textures = {
    BodyType.BLACK: BLACK_BODY,
    BodyType.BROWN: BROWN_BODY,
    BodyType.CALICO: CALICO_BODY,
    BodyType.GREY_WITH_WHITE: GREY_WITH_WHITE_BODY,
    BodyType.ORANGE: ORANGE_BODY,
    BodyType.RUSSIAN_BLUE: RUSSIAN_BLUE_BODY,
    BodyType.SIAMESE: SIAMESE_BODY,
    BodyType.WHITE: WHITE_BODY
}

var collar_textures = {
    CollarType.BLACK: BLACK_COLLAR,
    CollarType.BLUE: BLUE_COLLAR,
    CollarType.GREEN: GREEN_COLLAR,
    CollarType.LIGHT_BLUE: LIGHT_BLUE_COLLAR,
    CollarType.ORANGE: ORANGE_COLLAR,
    CollarType.PINK: PINK_COLLAR,
    CollarType.PURPLE: PURPLE_COLLAR,
    CollarType.RED: RED_COLLAR
}

var eye_textures = {
    EyeType.BLUE: BLUE_EYES,
    EyeType.DARK_GREEN: DARK_GREEN_EYES,
    EyeType.GREEN: GREEN_EYES,
    EyeType.ORANGE: ORANGE_EYES,
    EyeType.PALE: PALE_EYES,
    EyeType.PURPLE: PURPLE_EYES,
    EyeType.RED: RED_EYES,
    EyeType.YELLOW: YELLOW_EYES
}

var body_count: int = body_textures.size()
var collar_count: int = collar_textures.size()
var eyes_count: int = eye_textures.size()

func _ready():
    body.texture = body_textures.get(body_type, null)
    collar.texture = collar_textures.get(collar_type, null)
    eyes.texture = eye_textures.get(eye_type, null)

func set_body_to_next():
    body_type = (body_type + 1) % body_count

func set_body_to_previous():
    body_type = (body_type - 1 + body_count) % body_count

func set_collar_to_next():
    collar_type = (collar_type + 1) % collar_count

func set_collar_to_previous():
    collar_type = (collar_type - 1 + collar_count) % collar_count

func set_eyes_to_next():
    eye_type = (eye_type + 1) % eyes_count

func set_eyes_to_previous():
    eye_type = (eye_type - 1 + eyes_count) % eyes_count

var time_accumulator = 0.0

func _physics_process(delta: float) -> void:
    time_accumulator += delta
    
    # Check if 0.5 seconds have passed
    if time_accumulator >= 0.5:
        # Call the functions
        set_body_to_previous()
        set_collar_to_previous()
        set_eyes_to_previous()
        
        # Reset the accumulator
        time_accumulator = 0.0

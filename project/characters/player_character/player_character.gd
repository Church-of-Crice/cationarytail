extends CharacterBody2D

@export var speed: float = 80.0

var player_input: Vector2
var player_movement: Vector2
#var thought_bubble: Node
var disabled: bool = false

@onready var thought_bubble: ThoughtBubbleContainer = %ThoughtBubble

func _ready() -> void:
  pass
  # global_position = Globals.instance.spawn
  # Globals.instance.spawn = Vector2.ZERO
  # think_text("Meow", 2)

func think_text(text: String, time: float = 2.0) -> void:
  thought_bubble.call("start_thought_text", text, time)

func disable() -> void:
  disabled = true

func enable() -> void:
  disabled = false

func _physics_process(_delta: float) -> void:
  move()

func move() -> void:
  if disabled:
    return
  
  player_input = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
  player_movement = player_input * speed
  velocity = player_movement
  move_and_slide()

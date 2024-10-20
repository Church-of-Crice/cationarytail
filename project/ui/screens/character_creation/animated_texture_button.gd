extends TextureButton

@export var scale_multiplier: float = 1.1
@export var hover_color: Color = Color(1, 1, 1, 0.9)

var _original_scale: Vector2
var _original_color: Color

func _ready():
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	_original_scale = scale
	_original_color = modulate

func _on_mouse_entered():
	scale = _original_scale * scale_multiplier
	modulate = hover_color

func _on_mouse_exited():
	scale = _original_scale
	modulate = _original_color

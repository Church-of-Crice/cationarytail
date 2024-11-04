extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  pass # Replace with function body.

func close():
  visible = false
  collision_layer = 0
  
  

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  pass

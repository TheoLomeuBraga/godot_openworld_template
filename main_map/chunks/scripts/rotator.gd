extends Node3D



@export var rotation_speed : float = 180

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation_degrees.y += rotation_speed * delta

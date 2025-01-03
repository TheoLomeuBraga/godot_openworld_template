extends CharacterBody3D

@export var speed : float = 5.0
@export var rotate_speed : float = 180.0

func _physics_process(delta: float) -> void:
	var direction := (transform.basis * Vector3(0, 0, Input.get_axis("ui_up", "ui_down"))).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
	
	rotation_degrees.y += Input.get_axis("ui_right", "ui_left") * rotate_speed * delta
	move_and_slide()

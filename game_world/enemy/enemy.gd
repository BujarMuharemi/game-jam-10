extends CharacterBody2D

@export var movement_component: MovementComponent
@export var movement_direction: Vector2 = Vector2(1, 0)  # Default direction: Right
@export var flip_direction_on_boundary: bool = true

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	  # Ensure the movement direction is normalized
	if movement_direction != Vector2.ZERO:
		movement_direction = movement_direction.normalized()

	if movement_component:
		var movement = movement_component.move(delta, movement_direction)
		#print(movement)
		velocity.x = movement.x
		move_and_slide()
		
		if flip_direction_on_boundary and is_on_wall():
			movement_direction *= -1  # Reverse the X direction
	else:
		push_error("No movement_component set on enemy")

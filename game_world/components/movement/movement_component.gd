extends Node
class_name MovementComponent

# Speed and Acceleration
@export var max_speed: float = 200.0
@export var acceleration: float = 500.0
@export var friction: float = 300.0

# Movement direction (normalized vector)
var velocity: Vector2 = Vector2.ZERO

func set_speed(speed:float):
	acceleration = speed

func move(delta: float, input_direction: Vector2) -> Vector2:
	"""
	Updates the velocity and returns the new position offset.
	input_direction: Vector2 - the desired movement direction (should be normalized)
	delta: float - the frame delta time.
	"""
	# Accelerate in the input direction
	if input_direction != Vector2.ZERO:
		# Move velocity towards the target speed in the input direction
		var target_velocity = input_direction * max_speed
		velocity = velocity.move_toward(target_velocity, acceleration * delta)
	else:
		# Reduce velocity towards zero (friction effect)
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)

	return velocity * delta

extends CharacterBody2D

@onready var player_rig: Node2D = $player_rig

const SPEED = 500.0
const JUMP_VELOCITY = -700.0


func _physics_process(delta: float) -> void:
	var animationPlayer = player_rig.get_node("AnimationPlayer")

	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")

	# Toggle movement direction animation
	if direction > 0:
		player_rig.scale.x = 1  # Rechts
	elif direction < 0:
		player_rig.scale.x = -1  # Links

	# play animations
	if is_on_floor():
		if direction == 0:
			animationPlayer.play("idle")
		else:
			animationPlayer.play("walk")
	else:
		animationPlayer.play("jump")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	#for i in get_slide_collision_count():
	#	var collision = get_slide_collision(i)
		#print("I collided with ", collision.get_collider().name)

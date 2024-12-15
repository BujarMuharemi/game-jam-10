extends CharacterBody2D

@onready var player_rig: Node2D = $player_rig

const BASE_SPEED = 500.0
const JUMP_VELOCITY = -700.0
var SPEED = BASE_SPEED  # Standardgeschwindigkeit
var current_jump_velocity = JUMP_VELOCITY

var active_effects := {}
var drug_timer = 0
var drug_activated_flag=false
var drug_durataion = 0

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
		
		
func reset_speed():
	SPEED = BASE_SPEED
	drug_timer = 0
	print("Speed zurückgesetzt auf:", SPEED)
	drug_activated_flag = true

func apply_drug_effects(effects: Dictionary, duration: float):
	for effect in effects:
		match effect:
			"speed_multiplier":
				SPEED = BASE_SPEED * effects["speed_multiplier"]
			"jump_boost":
				current_jump_velocity = JUMP_VELOCITY * effects["jump_boost"]
			"reaction_time":
				print("Reaktionszeit verändert um:", effects["reaction_time"])
				# Hier könntest du die Reaktionszeit entsprechend anpassen

	active_effects = effects
	drug_timer = duration
	print("Neue Effekte angewendet:", effects, "für", duration, "Sekunden")

func set_speed(speed,duration):
	SPEED = speed * BASE_SPEED
	drug_durataion = duration
	drug_activated_flag=true

func consume_pickup(pickup: PickUp):
	pickup.apply_effect(self)

#func _on_area_entered(area: Area2D) -> void:
	#print("HALLO?")
	#if area.is_in_group("pickup"):
		#print("FOOOO")
		#consume_pickup(area.get_parent())

func _process(delta: float) -> void:
	if drug_activated_flag:
		drug_timer+= delta
		print(drug_timer,"----",drug_durataion)

		if drug_timer > drug_durataion:
			SPEED = BASE_SPEED
			drug_activated_flag=false
			drug_timer=0

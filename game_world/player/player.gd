extends CharacterBody2D

const BASE_SPEED = 500.0
const JUMP_VELOCITY = -700.0
var SPEED = BASE_SPEED  # Standardgeschwindigkeit
var current_jump_velocity = JUMP_VELOCITY

var active_effects := {}
var drug_timer = 0
var drug_activated_flag=false
var drug_durataion = 0

func _process(delta: float) -> void:
	if drug_activated_flag:
		drug_timer+= delta
		print(drug_timer,"----",drug_durataion)
		
		if drug_timer > drug_durataion:
			SPEED = BASE_SPEED
			drug_activated_flag=false
			drug_timer=0

func _physics_process(delta: float) -> void:
	# Add gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle movement
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	# Falls ein Drogeneffekt aktiv ist, reduziere den Timer
	#if drug_timer:
		#drug_timer -= delta
		#if drug_timer <= 0:
			#reset_speed()

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
	
func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("pickup"):
		consume_pickup(area.get_parent())

# Funktion, um den Drogeneffekt anzuwenden
#func apply_drug_effect(drug_type: String):
	#match drug_type:
		#"cocaine":
			#SPEED *= 2
			#drug_timer = 5.0  # Effekt dauert 5 Sekunden
			#print("Cocaine! Neue Geschwindigkeit:", SPEED)
		#"marijuana":
			#SPEED *= 0.5
			#drug_timer = 8.0  # Effekt dauert 8 Sekunden
			#print("Marijuana! Neue Geschwindigkeit:", SPEED)
		#"pill":
			#SPEED *= 3
			#drug_timer = 4.0  # Effekt dauert 4 Sekunden
			#print("Pill! Neue Geschwindigkeit:", SPEED)

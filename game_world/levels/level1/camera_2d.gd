extends Camera2D

# Define the camera boundaries (set to null for no boundaries)
@export var use_boundaries: bool = true
@export var boundary_top: float = -500.0
@export var boundary_bottom: float = 500.0
@export var boundary_left: float = -1000.0
@export var boundary_right: float = 1000.0

# Offset to keep the player slightly ahead of the camera
var offset_camera: Vector2 = Vector2(50, 0)

# Smooth follow settings
@export var smoothing_enabled: bool = true
@export var smoothing_speed: float = 5.0
var smoothing = false

@onready var player = get_parent()

func _ready():	
	
	#current = true
	if smoothing_enabled:
		smoothing = true
		smoothing_speed = smoothing_speed

func _process(delta):
	if not player:
		return

	# Calculate the target position
	var target_pos = player.global_position + offset_camera

	# Apply boundaries if enabled
	if use_boundaries:
		target_pos.x = clamp(target_pos.x, boundary_left + offset_camera.x, boundary_right - offset_camera.x)
		target_pos.y = clamp(target_pos.y, boundary_top + offset_camera.y, boundary_bottom - offset_camera.y)

	# Update camera position
	if smoothing_enabled:
		global_position = global_position.lerp(target_pos, delta * smoothing_speed)
	else:
		global_position = target_pos

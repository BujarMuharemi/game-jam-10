extends Node2D
class_name MoveComponent


@export var MOVE_SPEED:=1
var speed:float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	speed = MOVE_SPEED

func increase(pickup: Pickup):
	speed = pickup.increase_speed
	print(name,"health left",health)
	if speed <= 0:
		get_parent().queue_free()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

extends Node
class_name Pickup

var attack:Attack
@export var attack_damage:int = 10

var move_speed:float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	attack.attack_damage = attack_damage


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

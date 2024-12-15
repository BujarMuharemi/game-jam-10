extends Node2D
class_name HealthComponent


@export var MAX_HEALTH:=100
var health:int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = MAX_HEALTH

func damage(attack: Attack):
	health -= attack.attack_damage
	#print(name,"health left",health)
	if health <= 0:
		get_parent().queue_free()

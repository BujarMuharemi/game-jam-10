extends Area2D
class_name HitBoxComponent

@export var health_component : HealthComponent

func damage(attack:Attack):
	if health_component:
		print("damage !")
		health_component.damage(attack)
	else:
		print("lost in space ?")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

extends Node2D
class_name PickUp

@export var pickup_name: String = "generic_pickup"

func apply_effect(player):
	print("PickUp-Effekt für", pickup_name, "nicht definiert.")

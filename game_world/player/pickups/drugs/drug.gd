extends PickUp
class_name Drug

@export var speed_multiplier: float = 2.0
@export var effect_duration: float = 5.0

func apply_effect(player):
	if player.has_method("apply_drug_effect"):
		player.apply_drug_effect(speed_multiplier, effect_duration)
		print(pickup_name, "eingenommen! Geschwindigkeit x", speed_multiplier)
	else:
		print("Fehler: Spieler hat keine apply_drug_effect-Methode.")
	queue_free()  # Pickup löschen, nachdem es verwendet wurde

func get_speed_effect() -> float:
	return speed_multiplier

func get_duration() -> float:
	return effect_duration

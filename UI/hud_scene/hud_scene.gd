extends CanvasLayer

func _ready() -> void:
	update_health(14)

func update_health(health: int):
	$GameNameGroup/HealthLabel.text = str(health)
	
func update_bullets(current, max):
	$GameNameGroup/BulletLabel.text = str(current) + "/" + str(max)

func update_drugs(drugs):
	$GameNameGroup/DrugsLabel.text = str(drugs)
	

extends Area2D
class_name HitBoxComponent

@export var health_component : HealthComponent
var wasHit = false

func damage(attack:Attack):
	if health_component:
		#print("damage !")
		health_component.damage(attack)
	else:
		print("lost in space ?")



func _on_area_entered(area: Area2D) -> void:
	#print("??",area.name,area.get_groups())
	if(area.is_in_group("bullet")):
		
		var attack = area.get_parent().attack
		health_component.damage(attack)
		area.get_parent().queue_free()
		#$AudioStreamPlayer2D.stop()
		#$AudioStreamPlayer2D.set_stream(sfx)
		wasHit=true
		#$CollisionShape2D.set_disabled(true)
		#health_component.damage(attack)
		#self.remove_from_group("enemy")
		#self.get_parent().hide()
		#self.get_parent().queue_free()

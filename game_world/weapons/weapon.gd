extends Node

@export var attack_damage :=10
var knockbage_damage :=100
var stun_time := 1.5

'''
func on_hitbox_area_entered(area):
	if area is HitBoxComponent:
		var hitbox: HitBoxComponent = area
		print(name,"on_hitbox_area_entered")
		var attack = Attack.new()
		attack.attack_damage = attack_damage
		#attack.knockback_force = knockbage_damage
		#attack.stun_time = stun_time
		
		hitbox.damage(attack)
'''
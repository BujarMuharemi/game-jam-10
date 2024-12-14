extends Node2D
class_name Bullet

var direction = Vector2.ZERO
@export var speed = 100
@export var lifetime = 3
@export var damage:int = 20

var attack: Attack

# Called when the node enters the scene tree for the first time.
func _ready():
	#set_physics_process(true)
	
	attack = Attack.new()
	attack.attack_damage = damage


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#position += direction * speed * delta
	#position.x += speed * delta
	pass
	
func _physics_process(delta: float) -> void:
	#print(delta)
	position.x += speed * delta

extends Node2D

@export var speed = 350
@export var bullet_scene: PackedScene
@export var bullets = 30
@export var mag_size = 30

@export var gunCoolDownTime: float
@export var gunDistance := 30

signal bullet_shot
var canShootFlag = true

#var knockbage_damage :=100
#var stun_time := 1.5
var muzzle:Node2D
var bullet_dir:Vector2

func _ready() -> void:
	bullet_dir = Vector2.RIGHT
	muzzle = $Muzzle
	$GunCoolDown.wait_time = gunCoolDownTime

func set_dir(dir:Vector2):
	bullet_dir=dir
	

func _process(delta):
	
	if($GunCoolDown.is_stopped()):
		canShootFlag = true
	
	if Input.is_mouse_button_pressed(1) && canShootFlag && bullets>0: 	
		var bullet:Node2D = bullet_scene.instantiate()
		bullet.global_position = muzzle.global_position
		
		#TODO rotate bullet etc
		bullet.rotation_degrees = 90.0 * bullet_dir.x
		bullet.set_direction(bullet_dir)
		
		get_tree().root.get_child(0).add_child(bullet)
		#bullet.position = position + diff*gunDistance
		#var angle = bullet.position.angle_to(diff)
		canShootFlag = false
		$GunCoolDown.start()

	elif Input.is_mouse_button_pressed(1) && canShootFlag && bullets==0:
		#$GunDryFire.play()
		canShootFlag = false
		#$GunCoolDown.start()

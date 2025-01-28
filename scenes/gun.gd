extends Node2D

const BULLET = preload("res://scenes/bullet.tscn")
@onready var muzzle = $Marker2D
@export var max_ammo = 6
var curr_ammo = max_ammo
@export var reload_time = 2
@export var fire_rate = 0.13


func _process(delta):
	
	look_at(get_global_mouse_position())
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	
	if rotation_degrees > 90 and rotation_degrees < 270:
		scale.y = -1
	else:
		scale.y = 1
		
	if not $Reload_Timer.is_stopped():
		return
		
	if Input.is_action_just_pressed("fire"):	
		if curr_ammo > 0:
			shoot()
		else:
			reload()
			
	elif Input.is_action_just_pressed("reload") and curr_ammo < max_ammo:
		reload()
		
		
func shoot():
	
	if not $Shoot_Timer.is_stopped():
		return
		
	curr_ammo -= 1
	var bullet_instance = BULLET.instantiate()
	get_tree().root.add_child(bullet_instance)
	$Shoot_Sound.play()
	bullet_instance.global_position = muzzle.global_position
	bullet_instance.rotation = rotation
	
	$Shoot_Timer.start(0.25 - fire_rate)	

func reload():
	$Reload_Timer.start(reload_time)
	curr_ammo = max_ammo

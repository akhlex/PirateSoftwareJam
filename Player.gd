extends CharacterBody2D


@export var SPEED = 125.0
@export var ACCELERATION = 600
@export var FRICTION = 400
@export var max_health = 3
@export var kb_str = 500

@onready var curr_health = max_health


signal healthChanged


func _physics_process(delta):


	var dir = Input.get_vector("left", "right", "up", "down")
	if dir:
		velocity.x = move_toward(velocity.x, dir.x * SPEED, delta * ACCELERATION)
		velocity.y = move_toward(velocity.y, dir.y * SPEED, delta * ACCELERATION)
		
	else:
		velocity.x = move_toward(velocity.x, dir.x * SPEED, delta * FRICTION)
		velocity.y = move_toward(velocity.y, dir.y * SPEED, delta * FRICTION)
		
	
	if get_global_mouse_position().x < global_position.x:
		$Player_Sprite.flip_h = true
	else:
		$Player_Sprite.flip_h = false
	
	move_and_slide()


func _on_area_2d_area_entered(area):
	if area.name == "Mob_Area":
		curr_health -= 1
		healthChanged.emit(curr_health)
		knockback(area.get_parent().velocity)
		$Damage_Taken_Sound.play()	
		
		$Player_Sprite.material.set_shader_parameter("opacity", 0.7)
		$Player_Sprite.material.set_shader_parameter("r", 1.0)
		$Player_Sprite.material.set_shader_parameter("g", 0.0)
		$Player_Sprite.material.set_shader_parameter("b", 0.0)
		$Player_Sprite.material.set_shader_parameter("mix_color", 0.7)
		
		if curr_health <= 0:
			queue_free()
			get_tree().change_scene_to_file("res://scenes/game_over.tscn")


func _on_area_2d_area_exited(area):
	if area.name == "Mob_Area":
		$Player_Sprite.material.set_shader_parameter("mix_color", 0.0)
		

func knockback(mobVelocity):
	var kb_dir = (mobVelocity - velocity).normalized() * kb_str
	velocity = kb_dir
	move_and_slide()

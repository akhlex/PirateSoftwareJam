extends CharacterBody2D


@export var SPEED = 200.0
@export var ACCELERATION = 1200
@export var FRICTION = 800
@export var HP = 5


func _physics_process(delta):


	var dir = Input.get_vector("left", "right", "up", "down")
	if dir:
		velocity.x = move_toward(velocity.x, dir.x * SPEED, delta * ACCELERATION)
		velocity.y = move_toward(velocity.y, dir.y * SPEED, delta * ACCELERATION)
	else:
		velocity.x = move_toward(velocity.x, dir.x * SPEED, delta * FRICTION)
		velocity.y = move_toward(velocity.y, dir.y * SPEED, delta * FRICTION)
	
	if get_global_mouse_position().x < global_position.x:
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.flip_h = false
		
	#var collision = move_and_collide(velocity * delta)
	#if collision:
		#print("Collided with ", collision.get_collider().name)
	
	move_and_slide()


func _on_area_2d_area_entered(area):
	if area.name == "Mob_Area":
		HP -= 1
		if HP <= 0:
			print("dead")
			HP = 3

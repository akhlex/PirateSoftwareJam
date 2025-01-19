extends CharacterBody2D


@export var SPEED = 300.0

func get_input():
	look_at(get_global_mouse_position())
	velocity = transform.x * Input.get_axis("ui_down", "ui_up") * SPEED

func _physics_process(delta):

	get_input()
	move_and_slide()

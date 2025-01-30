extends CharacterBody2D

@export var HP = 3
@export var SPEED = 50.0
var player_scene = preload("res://scenes/player.tscn")
@onready var player = get_parent().get_node("Player")
var player_pos
var target_pos


func _process(delta):
	player_pos = player.position
	target_pos = (player_pos - position).normalized() 
	if position.distance_to(player_pos) > 3:
		position += target_pos * SPEED * delta


func _on_area_2d_area_entered(area):
	if area.name == "Bullet_Area":
		$Damage_Sound.play()
		area.get_parent().queue_free()
		HP -= 1
		if HP <= 0:
			Global.score += 1
			queue_free() 

extends Node2D

var mob = preload("res://scenes/mob.tscn")

func _ready():
	randomize()


func _process(delta):
	pass


func _on_mob_timer_timeout():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	$Path2D/PathFollow2D.progress = rng.randi_range(0, 3664)
	var mob_instance = mob.instantiate()
	
	mob_instance.position = $Path2D/PathFollow2D/Marker2D.global_position
	add_child(mob_instance)

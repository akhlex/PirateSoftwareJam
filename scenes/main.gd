extends Node2D

var mob = preload("res://scenes/mob.tscn")
@onready var hearts = $Player/Hearts_Container
@onready var player = %Player

func _ready():
	hearts.setMaxHearts(player.max_health)
	hearts.updateHearts(player.curr_health)
	player.healthChanged.connect(hearts.updateHearts)
	randomize()


func _process(delta):
	pass


func _on_mob_timer_timeout():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	$Player/Camera2D/Path2D/PathFollow2D.progress = rng.randi_range(0, 3664)
	var mob_instance = mob.instantiate()
	
	mob_instance.position = $Player/Camera2D/Path2D/PathFollow2D/Marker2D.global_position
	add_child(mob_instance)

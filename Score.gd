extends CanvasLayer


@onready var mob = preload("res://scenes/mob.tscn")


func _process(delta):
	$Score_Label.text = "Score: " + str(Global.score)

extends CanvasLayer


@onready var mob = preload("res://scenes/mob.tscn")


func _process(delta):
	$HBoxContainer/Score_Label.text = str(Global.score)

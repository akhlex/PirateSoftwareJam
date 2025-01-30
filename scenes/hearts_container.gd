extends HBoxContainer


@onready var heart_scene = preload("res://scenes/heart.tscn")


func setMaxHearts(max: int):
	for i in range(max):
		var heart = heart_scene.instantiate()
		add_child(heart)
	pass


func updateHearts(currHealth: int):
	var hearts = get_children()
	
	for i in range(currHealth):
		hearts[i].update(true)
		
	for i in range(currHealth, hearts.size()):
		hearts[i].update(false)

extends Control


func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
	
func _process(delta):
	$Final_Time.text = "You Survived for " + str(Global.time) + " seconds"
	$Final_Score.text = "Your Score: " + str(Global.score)

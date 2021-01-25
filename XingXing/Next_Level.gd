extends Button


func _on_Next_Level_pressed():
	if Global.level == 1:
		Global.path = "res://World.tscn"
		get_tree().change_scene("res://World.tscn")
	if Global.level == 2:
		Global.path = "res://Bonus_Scen.tscn"
		get_tree().change_scene("res://Bonus_Scen.tscn")
	elif Global.level > 2:
		Global.path= "res://World1.tscn"
		get_tree().change_scene("res://Titlescreen.tscn")

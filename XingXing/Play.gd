extends Button


func _on_Play_pressed():
	Global.hearts = 3
	get_tree().change_scene("res://World1.tscn")

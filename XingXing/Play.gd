extends Button

func _on_Play_button_up():
	Global.hearts = 4
	get_tree().change_scene("res://World1.tscn")

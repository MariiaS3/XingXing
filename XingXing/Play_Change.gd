tool
extends Button

export(String,FILE) var next_scene_path: = ""

func _on_Play_button_up():
	Global.hearts = 4
	get_tree().change_scene(next_scene_path)
	

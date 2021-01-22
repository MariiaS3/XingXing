
extends Button


func _on_Main_pressed():
	Global.hearts = 4
	get_tree().change_scene("res://Titlescreen.tscn")

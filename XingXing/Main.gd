
extends Button


func _on_Main_pressed():
	Global.hearts = 4
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Titlescreen.tscn")

tool
extends Area2D

export(String,FILE) var next_scene = ""
export(Vector2) var  player_spawn_location = Vector2.ZERO
export(int) var  player_direction = 1

func  _get_configuration_warning() -> String:
	return "The next scene property  can't be empty" if not next_scene else ""


func _on_Portal_body_entered(_body):
	Global.player_initial_map_position = player_spawn_location
	Global.player_facing_direction = player_direction
	Global.temp = 1 
	if get_tree().change_scene(next_scene) != OK:
		print("ERR")



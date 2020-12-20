tool
extends Area2D

#export(PackedScene) var next_scene
#export var next_scene: PackedScene

#func  _get_configuration_warning() -> String:
	#return "The next scene property  can't be empty" if not next_scene else ""
#func _input(event):
#	if event.is_action_pressed("ui_accept"):
#		if get_overlapping_bodies().size() > 0:
#			if !next_scene: # is null
#				print("no scene in this door")
#				return
#			get_overlapping_bodies()[0].play_walk_in_animation() # 0 will be our player

##	var ERR = get_tree().change_scene_to(next_scene)
	#get_tree().change_scene_to(next_scene)
	

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



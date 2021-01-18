extends Node2D
 
var player_initial_map_position = Vector2(168,192)
var player_facing_direction = 1
var DisplayValue = 0
var save_path = "res://save-file.cfg"
var config = ConfigFile.new()
var _settings = config.load(save_path)

func _ready():
	pass
	
func save_game(section,key):
	config.set_value(section,key,DisplayValue)
	config.save(save_path)


func load_game(section,key):
	DisplayValue = config.get_value(section,key,DisplayValue)
	


extends Node2D
 
var player_initial_map_position = Vector2(168,192)
var player_facing_direction = 1
var DisplayValue = 0
var save_path = "res://save-file.cfg"
var config = ConfigFile.new()
var _settings = config.load(save_path)
var bounce = false
var coins=0
var hearts_max = 3
var hearts = hearts_max

func _ready():
	pass
	
func save_game(section,key,value):
	config.set_value(section,key,value)
	config.save(save_path)



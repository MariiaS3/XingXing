extends Node2D
var level=0
var path = "res://World1.tscn"
var player_initial_map_position = Vector2(168,192)
var player_facing_direction = 1
var DisplayValue = 0
var save_path = "res://save-file.cfg"
var config = ConfigFile.new()
var _settings = config.load(save_path)
var map_position = Vector2(0,0)
var bounce = false
var hearts_max = 3
var hearts = hearts_max

var retry_coins =0
var retry_heart = 3

func _ready():
	pass
	
func save_game(section,key,value):
	config.set_value(section,key,value)
	config.save(save_path)



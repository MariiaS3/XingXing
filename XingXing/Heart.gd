extends Control

var size = 200

func _ready():
	on_player_life_changed(Global.hearts)

func on_player_life_changed(player_hearts):
	$TextureRect.rect_size.x = player_hearts * size
	Save_hud()

func Save_hud():
	get_node("/root/Global").save_game("Values","ValuTwo",Global.hearts)

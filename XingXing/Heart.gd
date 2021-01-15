extends Control

var size = 200

func on_player_life_changed(player_hearts):
	$TextureRect.rect_size.x = player_hearts * size


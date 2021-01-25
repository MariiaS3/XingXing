extends CanvasLayer

var size = 200

func _ready():
	on_player_life_changed(Global.hearts)

func on_player_life_changed(player_hearts):
	$Control/TextureRect.rect_size.x = player_hearts * size
	Save_hud()

func Save_hud():
	get_node("/root/Global").save_game("Values","ValueTwo",Global.hearts)


func _on_Heart_Bronze_heart_collected():
	get_node("/root/Global").hearts += 1
	_ready()

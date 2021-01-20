extends CanvasLayer

var coins = 0

func _ready():
	$coins.text = String(Global.DisplayValue)
	Save_hud()


func _on_coin_collected():
	coins = coins + 1
	get_node("/root/Global").DisplayValue += 1
	_ready()

func Save_hud():
	get_node("/root/Global").save_game("Values","ValueOne",Global.DisplayValue)






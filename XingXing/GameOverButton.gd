extends Button


func _on_GameOverButton_pressed():
	Global.DisplayValue = Global.retry_coins
	Global.hearts = Global.retry_heart
	get_tree().change_scene("res://Titlescreen.tscn")
	

extends Button

func _on_Retry_button_up():
	Global.DisplayValue = Global.retry_coins
	Global.hearts = Global.retry_heart
	get_tree().paused = false
	get_tree().reload_current_scene()

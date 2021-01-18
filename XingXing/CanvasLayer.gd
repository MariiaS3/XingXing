extends CanvasLayer

func _input(event):
	if event.is_action_pressed("reward"):
		$Rewards.visible = !$Rewards.visible
		$Rewards.initialize_inventory()

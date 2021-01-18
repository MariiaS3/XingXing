extends CanvasLayer


func _input(event):
	if event.is_action_pressed("reward"):
		$Reward.visible = !$Reward.visible

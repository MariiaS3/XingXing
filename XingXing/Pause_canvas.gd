extends CanvasLayer

func _input(event):
	if event.is_action_pressed("pause"):
		$Pause.visible = !$Pause.visible

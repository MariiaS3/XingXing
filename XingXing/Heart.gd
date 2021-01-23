extends Area2D

signal heart_collected

func _on_Heart_body_entered(_body):
	$AnimatedSprite.play("bounce")
	emit_signal("heart_collected")
	set_collision_mask_bit(0, false)
	queue_free()

	


extends Area2D

signal coin_collected

func _on_coin_body_entered(body):
	queue_free()
	emit_signal("coin_collected")
	set_collision_mask_bit(0, false)

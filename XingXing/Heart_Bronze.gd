tool
extends Area2D

signal heart_collected

func _on_Heart_Bronze_body_entered(body):
	$AnimatedSprite.play("heart")
	emit_signal("heart_collected")
	set_collision_mask_bit(0, false)
	queue_free()

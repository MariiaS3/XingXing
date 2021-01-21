extends Node2D

<<<<<<< HEAD

func _on_Fallzone_body_entered(_body):
	Global.hearts = Global.hearts - 1
	_body.position.x -=100
	_body.position.y -=200
	emit_signal("life_changed", Global.hearts)
	if Global.hearts <= 0:
		get_tree().change_scene("res://GameOver.tscn")
=======
func _on_Fallzone_body_entered(body):
	$KinematicBody2D.Fall()
>>>>>>> de4f515eefd5b9495436c713b7899d54bbcfea44

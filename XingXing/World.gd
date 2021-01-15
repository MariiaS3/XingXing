extends Node


func _on_body_entered(_body):
	$Area2D.teleport()
	

func _on_Fallzone_body_entered(_body):
	$KinematicBody2D.Fall()


func _on_Wiesielec_body_entered(_body):
	$KinematicBody2D.quiz()
	



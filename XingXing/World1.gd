extends Node


func _on_Fallzone_body_entered(body):
	$KinematicBody2D.Fall(body)


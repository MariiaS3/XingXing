extends Node

const OFFSET_RIGHT = Vector2(32,0)
const OFFSET_LEFT = Vector2(-32,0)

func _on_body_entered(body):
	$Area2D.teleport()


func _on_Fallzone_body_entered(body):
	$KinematicBody2D.Fall()

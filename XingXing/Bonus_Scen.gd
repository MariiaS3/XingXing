extends Node

const OFFSET_RIGHT = Vector2(50,10)
const OFFSET_LEFT = Vector2(50,10)


func _on_Fallzone_body_entered(_body):
	$KinematicBody2D.Fall(_body)


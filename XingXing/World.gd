extends Node

const OFFSET_RIGHT = Vector2(32,0)
const OFFSET_LEFT = Vector2(-32,0)

func _on_body_entered(body):
	$Area2D.teleport()


func _on_Portal_1_body_entered(body):
	$Portal_1.tel($KinematicBody2D, $Portal_2,OFFSET_RIGHT)


func _on_Portal_2_body_entered(body):
	$Portal_2.tel($KinematicBody2D, $Portal_1,OFFSET_LEFT)

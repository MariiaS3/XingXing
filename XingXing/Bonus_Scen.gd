extends Node

const OFFSET_RIGHT = Vector2(50,10)
const OFFSET_LEFT = Vector2(50,10)


func _on_Fallzone_body_entered(_body):
	$KinematicBody2D.Fall(_body)

func _on_Local_portal_body_entered(_body):
	$Local_portal.tel($KinematicBody2D, $Local_portal2,OFFSET_LEFT)


func _on_Local_portal2_body_entered(_body):
	$Local_portal2.tel($KinematicBody2D, $Local_portal,OFFSET_RIGHT)

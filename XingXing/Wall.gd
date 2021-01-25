extends Area2D

func _on_Node2D_body_entered(body):
	Global.map_position = body.position
	print(Global.map_position)


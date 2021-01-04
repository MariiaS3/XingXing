extends Area2D

func _ready() -> void:
	set_physics_process(false)
	
func tel(object, end, offset):
	object.position = end.position + offset


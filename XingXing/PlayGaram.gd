extends Node2D


signal garam

var garam: = 0 setget set_garam

func set_garam(new_value: int) -> void:
	garam = new_value
	emit_signal("garam")


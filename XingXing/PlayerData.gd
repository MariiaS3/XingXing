extends Node

signal quiz

var quize: = 0 setget set_quiz


func reset():
	self.quize = 0


func set_quiz(new_value: int) -> void:
	quize = new_value
	emit_signal("quiz")

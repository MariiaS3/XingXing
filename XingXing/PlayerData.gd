extends Node


signal updated
signal quiz

var score: = 0 setget set_score
var quize: = 0 setget set_quiz


func reset():
	self.score = 0
	self.deaths = 0


func set_score(new_score: int) -> void:
	score = new_score
	emit_signal("updated")


func set_quiz(new_value: int) -> void:
	quize = new_value
	emit_signal("quiz")

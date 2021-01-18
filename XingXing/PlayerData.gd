extends Node

signal quiz
signal garam
signal sudoku

var sudok: = 0 setget set_sud
var garam: = 0 setget set_garam
var quize: = 0 setget set_quiz

func set_quiz(new_value: int) -> void:
	quize = new_value
	emit_signal("quiz")

func set_garam(new_value: int) -> void:
	garam = new_value
	emit_signal("garam")

func set_sud(new_value: int) -> void:
	sudok = new_value
	emit_signal("sudoku")

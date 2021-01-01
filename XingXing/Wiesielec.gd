extends KinematicBody2D

export var score: = 100


func _ready() -> void:
	set_physics_process(false)


func die() -> void:
	PlayerData.score += score
	queue_free()



func _on_Area2D_body_entered(body):
	die()

extends StaticBody2D

var velocity = Vector2()
export var direction = -1

var is_dead = false 
var i=0

signal life_mashrum(player_hearts)

func _ready():
	connect("life_mashrum", get_parent().get_node("Hearts/Control"), "on_player_life_changed")
	emit_signal("life_mashrum", Global.hearts)

func dead():
	if i==2:
		is_dead = true
		velocity = Vector2(0,0)
		$Timer.start()
	i=i+1


func _on_body_entered(_body):
	Global.hearts = Global.hearts - 1
	if Global.bounce == false:
		_body.position.x -=50
	else:
		_body.position.x +=50
	emit_signal("life_mashrum", Global.hearts)
	if Global.hearts <= 0:
		get_tree().change_scene("res://GameOver.tscn")

func _on_Timer_timeout():
	queue_free()

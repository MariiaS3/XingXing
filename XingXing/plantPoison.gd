extends StaticBody2D

var velocity = Vector2()
export var direction = -1

var is_dead = false 


signal life_plant(player_hearts)

func _ready():
	connect("life_plant", get_parent().get_node("Hearts"), "on_player_life_changed")
	emit_signal("life_plant", Global.hearts)



func dead():
	
	is_dead = true
	velocity = Vector2(0,0)
	queue_free()


func _on_Plant_body_entered(_body):
	Global.hearts = Global.hearts - 1
	if Global.bounce == false:
		_body.position.x -=50
	else:
		_body.position.x +=50
	emit_signal("life_plant", Global.hearts)
	if Global.hearts <= 0:
		get_tree().change_scene("res://GameOver.tscn")


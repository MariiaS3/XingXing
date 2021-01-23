extends KinematicBody2D

signal life_changed(player_hearts)

var velocity = Vector2()
var speed = 50
export var direction = -1

var is_dead = false 
var i=0

func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true
	
	connect("life_changed", get_parent().get_node("Hearts"), "on_player_life_changed")
	emit_signal("life_changed", Global.hearts_max)
		
func _physics_process(_delta):
	if is_on_wall():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h

	velocity.y += 20
	velocity.x = speed * direction
	velocity = move_and_slide(velocity, Vector2.UP)

func _on_Check2_body_entered(body):
	speed = 0
	set_collision_layer_bit(4, false)
	set_collision_mask_bit(0, false)
	$Check2.set_collision_layer_bit(14, false)
	$Check2.set_collision_mask_bit(0, false)
	$Check1.set_collision_layer_bit(14, false)
	$Check1.set_collision_mask_bit(0, false)
	$Timer.start()


func _on_Check1_body_entered(body):
	Global.hearts = Global.hearts - 1
	if Global.bounce == false:
		body.position.x -=50
	else:
		body.position.x +=50
	print(body.position)
	emit_signal("life_changed", Global.hearts)
	if Global.hearts <= 0:
		get_tree().change_scene("res://GameOver.tscn")


func _on_Timer_timeout():
	queue_free()

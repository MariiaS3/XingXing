extends KinematicBody2D

const GRAVITY = 10
const SPEED = 100
const FLOOR = Vector2(0,-1)

var velocity  = Vector2()
var direction =1 

signal life_(player_hearts)

var is_dead = false 
var i=0

func _ready():
	connect("life_", get_parent().get_node("Hearts/Control"), "on_player_life_changed")
	emit_signal("life_", Global.hearts)
	
	
func _physics_process(delta):
	velocity.x = SPEED * direction
	
	if direction == 1:
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true
	
	$AnimatedSprite.play("walk")
	
	velocity.y += GRAVITY
	
	if is_dead==false:
		velocity.y += 20
		velocity.x = 50 * direction
		
		
	velocity = move_and_slide(velocity, FLOOR)
	
	if is_on_wall():
		direction = direction * -1
		$RayCast2D.position.x *= -1
		
	if $RayCast2D.is_colliding() == false:
		direction = direction * -1
		$RayCast2D.position.x *= -1


func dead():
	if i==4:
		is_dead = true
		velocity = Vector2(0,0)
		queue_free()
	i=i+1



func _on_Area2D_body_entered(_body):
	Global.hearts = Global.hearts - 1
	if Global.bounce == false:
		_body.position.x -=50
	else:
		_body.position.x +=50
	emit_signal("life_", Global.hearts)
	if Global.hearts <= 0:
		get_tree().change_scene("res://GameOver.tscn")

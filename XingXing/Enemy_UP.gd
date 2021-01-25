extends KinematicBody2D

signal life_changed(player_hearts)

var velocity = Vector2()
var speed = 50
export var direction = 1


const GRAVITY = 10
const SPEED = 200
const FLOOR = Vector2(0,-1)

var is_dead = false 
var i=0

func _ready():
# warning-ignore:return_value_discarded
	connect("life_changed", get_parent().get_node("Hearts"), "on_player_life_changed")
	emit_signal("life_changed", Global.hearts_max)
	
func _physics_process(_delta):
	velocity.x = SPEED * direction
	
	if direction == 1:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
	
	$AnimatedSprite.play("walk")
	
	velocity.y += GRAVITY
	
	if is_dead==false:
		velocity.y += 20
		velocity.x = speed * direction

	velocity = move_and_slide(velocity, Vector2.UP)
	
	if is_on_wall():
		direction = direction * -1
		$RayCast2D.position.x *= -1
		
	if $RayCast2D.is_colliding() == false:
		direction = direction * -1
		$RayCast2D.position.x *= -1

	

func _on_Dead_Enemy_body_entered(_body):
	set_collision_layer_bit(4, false)
	set_collision_mask_bit(0, false)
	$Dead_Enemy.set_collision_layer_bit(14, false)
	$Dead_Enemy.set_collision_mask_bit(0, false)
	$Dead_Kosmita.set_collision_layer_bit(14, false)
	$Dead_Kosmita.set_collision_mask_bit(0, false)
	is_dead = true
	queue_free()

func dead():
	if i==2:
		i=i+1

func _on_Dead_Kosmita_body_entered(body):
	Global.hearts = Global.hearts - 1
	if Global.bounce == false:
		body.position.x -=50
	else:
		body.position.x +=50
	print(body.position)
	emit_signal("life_changed", Global.hearts)
	if Global.hearts <= 0:
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://GameOver.tscn")


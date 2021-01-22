extends KinematicBody2D


signal life_changed(player_hearts)

var velocity = Vector2()
export var direction = -1

var is_dead = false 
var i=0

func _ready():
	connect("life_changed", get_parent().get_node("Hearts/Control"), "on_player_life_changed")
	emit_signal("life_changed", Global.hearts)
	
func _physics_process(_delta):
	
	if is_on_wall():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$RayCast2D.position.x = $CollisionShape2D.shape.get_extents().x * direction
	
	if is_dead==false:
		velocity.y += 20
		velocity.x = 50 * direction
		
	velocity = move_and_slide(velocity, Vector2.UP)
	

func dead():
	if i==2:
		is_dead = true
		velocity = Vector2(0,0)
		queue_free()
	i=i+1


func _on_Checker_body_entered(body):
	Global.hearts = Global.hearts - 1
	if Global.bounce == false:
		body.position.x -=50
	else:
		body.position.x +=50
	print(body.position)
	emit_signal("life_changed", Global.hearts)
	if Global.hearts <= 0:
		get_tree().change_scene("res://GameOver.tscn")



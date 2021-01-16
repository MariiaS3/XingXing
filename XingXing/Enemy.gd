extends KinematicBody2D

signal life_changed(player_hearts)

var velocity = Vector2()
export var direction = -1

var max_hearts = 3
var hearts = max_hearts

var is_dead = false 
var i=0

func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true
		
	$RayCast2D.position.x = $CollisionShape2D.shape.get_extents().x * direction
	
	connect("life_changed", get_parent().get_node("Hearts/Control"), "on_player_life_changed")
	emit_signal("life_changed", max_hearts)
		
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
		$CollisionShape2D.disabled = true
		$Timer.start()
	i=i+1


func _on_Checker_body_entered(_body):
	hearts = hearts - 1
	emit_signal("life_changed", hearts)
	if hearts <= 0:
		get_tree().change_scene("res://World.tscn")


func _on_Timer_timeout():
	queue_free()

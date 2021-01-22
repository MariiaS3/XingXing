extends KinematicBody2D

signal life_changed(player_hearts)

var velocity = Vector2()
export var direction = -1

var is_dead = false 
var i=0

func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true
		
	#$RayCast2D.position.x = $CollisionShape2D.shape.get_extents().x * direction
	
	connect("life_changed", get_parent().get_node("Hearts"), "on_player_life_changed")
	emit_signal("life_changed", Global.hearts_max)
		
func _physics_process(_delta):
	
	if is_on_wall():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
	#	$RayCast2D.position.x = $CollisionShape2D.shape.get_extents().x * direction



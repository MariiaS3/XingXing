extends KinematicBody2D

var velocity = Vector2()
export var direction = -1

func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true
		
	$RayCast2D.position.x = $CollisionShape2D.shape.get_extents().x * direction
		
func _physics_process(delta):
	
	if is_on_wall():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$RayCast2D.position.x = $CollisionShape2D.shape.get_extents().x * direction
		
	velocity.y += 20
	velocity.x = 50 * direction
		
	velocity = move_and_slide(velocity, Vector2.UP)
	

	


func _on_Checker_body_entered(body):
	get_tree().change_scene("res://World.tscn")

extends Node2D

const SPEED = 300
var velocity = Vector2() 
var direction = 1

func set_fire(dir):
	direction = dir
	if dir ==  -1:
		$Area2D/AnimatedSprite.flip_h =true
	

func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)
	$Area2D/AnimatedSprite.play("fire")


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D_body_entered(body):
	if "Enemy" in body.name:
		body.dead()
	queue_free()

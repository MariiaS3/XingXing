extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 200
const HEIGHT = -600

var motion = Vector2()

func _process(delta):
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("Walk")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("Walk")
	else:
		$AnimatedSprite.play("Idle")
		motion.x = 0
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = HEIGHT
	else:
		$AnimatedSprite.play("Jump")
		
	motion = move_and_slide(motion, UP)
	pass


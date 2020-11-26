extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 10
const SPEED = 200
const HEIGHT = -600
const FIREBALL = preload("res://Node2D.tscn")
var motion = Vector2()
var on_ground = false
var is_attacking = false

func _physics_process(delta):
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right" ):
		if is_attacking == false || is_on_floor() == false: 
			motion.x = SPEED 
			if is_attacking == false:
				$AnimatedSprite.flip_h = false
				$AnimatedSprite.play("Walk")
				if sign($Position2D.position.x) == -1:
					$Position2D.position.x *= -1
	elif Input.is_action_pressed("ui_left"):
		if is_attacking == false || is_on_floor() == false: 
			motion.x = -SPEED
			if is_attacking == false:
				$AnimatedSprite.flip_h = true
				$AnimatedSprite.play("Walk")
				if sign($Position2D.position.x) == 1:
					$Position2D.position.x *= -1
	else:
		motion.x = 0
		if on_ground == true && is_attacking == false:
			$AnimatedSprite.play("Idle")
		elif on_ground == false && is_attacking == false:
			$AnimatedSprite.play("jump")
		
	if Input.is_action_just_pressed("ui_up"):
		if is_attacking == false: 
			if on_ground == true:
				motion.y = HEIGHT
				on_ground = false
			
	if Input.is_action_just_pressed("ui_shoot" ) && is_attacking == false:
		if is_on_floor():
			motion.x = 0
		is_attacking = true
		$AnimatedSprite.play("attack")
		var fire = FIREBALL.instance()
		if sign($Position2D.position.x) == 1:
			fire.set_fire(1)
		else:
			fire.set_fire(-1)
		get_parent().add_child(fire)
		fire.position = $Position2D.global_position
	motion.y += GRAVITY
	
	if is_on_floor():
		if on_ground == false:
			is_attacking = false
		on_ground = true
	else:
		if is_attacking == false:
			on_ground = false
			if motion.y < 0:
				if Input.is_action_pressed("ui_right"):
					motion.x = SPEED
					$AnimatedSprite.flip_h = false
					$AnimatedSprite.play("jump_r_l")
				elif Input.is_action_pressed("ui_left"):
					motion.x = -SPEED
					$AnimatedSprite.flip_h = true
					$AnimatedSprite.play("jump_r_l")
			
		
	
	
	motion = move_and_slide(motion, UP)
	pass



func _on_AnimatedSprite_animation_finished():
	is_attacking = false
	pass

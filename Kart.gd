extends KinematicBody2D

var speed = 0
var acceleration = 5
var decceleration = 3

const MAX_SPEED = 280
const FRICTION = 10


func _physics_process(delta):
	var is_pressing_move = false

	if Input.is_action_pressed("ui_up"):
		speed += acceleration
		if speed < 0:
			speed += FRICTION
			
		is_pressing_move = true
		speed = clamp(speed, min(speed, 0), MAX_SPEED)
	elif Input.is_action_pressed("ui_down"):
		speed -= decceleration
		if speed > 0:
			speed -= FRICTION
		is_pressing_move = true
		speed = clamp(speed, -MAX_SPEED, max(speed, 0))
		
	if not is_pressing_move:
		if speed > 0:
			speed -= FRICTION
			speed = clamp(speed, 0, MAX_SPEED)
		else:
			speed += FRICTION
			speed = clamp(speed, -MAX_SPEED, 0)

	if Input.is_action_pressed("ui_left"):
		self.rotation -= 0.05
	elif Input.is_action_pressed("ui_right"):
		self.rotation += 0.05
	
	var move = get_transform().x
	
	var motion = move * speed
	
	move_and_slide(motion)
	
		
		
		
		
		
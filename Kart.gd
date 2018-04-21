extends KinematicBody2D

var direction = Vector2()
var speed = 0
var acceleration = 5
var decceleration = 10

var motion = Vector2()
var target_motion =  Vector2()
var steering = Vector2()
var target_angle = 0

var skin = null

const MASS = 2
const MAX_SPEED = 60


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	skin = $Sprite

func _physics_process(delta):
	
	# The input works the same way as in the previous top-down demo. We reset the direction to (0, 0) on every frame and modify the vector based on the input. With 4 keys supported, you get 8 possible directions.
	var is_pressing_move = false

	if Input.is_action_pressed("ui_up"):
		speed += acceleration
		is_pressing_move = true
	elif Input.is_action_pressed("ui_down"):
		speed -= decceleration
		is_pressing_move = true
		
	if not is_pressing_move:
		speed -= decceleration/2
		
	speed = clamp(speed, 0, MAX_SPEED)

	if Input.is_action_pressed("ui_left"):
		self.rotation -= 0.05
	elif Input.is_action_pressed("ui_right"):
		self.rotation += 0.05
	
	var move = get_transform().x
	
	var motion = move * speed
	print(motion)
	
	move_and_slide(motion)
	
		
		
		
		
		
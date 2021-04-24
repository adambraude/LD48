extends KinematicBody2D

# physics
const SPEED = 600
const PASSIVE_JUMP: int = 1000
const MAX_JUMP = 2000
const GRAVITY: int = 800
const FALL_MULTIPLIER: float = 1.0
const SHORT_JUMP_SCALE: float = 2000.0

var jumping: bool = true;

var vel : Vector2 = Vector2()
var grounded : bool = false

# components
onready var sprite = $Sprite

func _ready():
	hide()

func _physics_process(delta):
	# reset horizontal velocity
	vel.x = 0
	
	# Gravity and Velocity
	vel.y += GRAVITY * delta
	vel += Vector2.DOWN * 9.81 * GRAVITY * delta
	
	# movement inputs
	if Input.is_action_pressed("ui_left"):
		vel.x -= SPEED
	if Input.is_action_pressed("ui_right"):
		vel.x += SPEED

	# jump input
	#if Input.is_action_pressed("jump") and is_on_floor():
	#	vel.y -= jumpForce
	
	# If the jump button is being pressed, initiate normal jump
	if Input.is_action_pressed("jump"):
		if is_on_floor():
			jump()
			jumping = true
	
	# If player hits ground without pressing the jump button, jump the passive
	# amount
	if is_on_floor():
		vel.y -= PASSIVE_JUMP
		jumping = true
	
	# If player is no longer pressing the jump button, cut jump early
	#if Input.is_action_just_released("jump"):
		#jump_cut(delta)
		#jumping = false
	
	if vel.y > 0:
		vel += Vector2.UP * (-9.81) * FALL_MULTIPLIER
	
	
	# applying the velocity
	vel = move_and_slide(vel, Vector2.UP)
	
	# gravity
	#vel.y += GRAVITY * delta
	#if jumping:
	#	vel += Vector2.DOWN * 9.81 * GRAVITY * delta
	#else:
	#	vel += Vector2.DOWN * 9.81 * SHORT_JUMP_SCALE * delta
	
	# sprite direction
	if vel.x < 0:
		sprite.flip_h = true
	elif vel.x > 0:
		sprite.flip_h = false

func jump():
	vel.y = -MAX_JUMP

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

# Not quite sure what the numbers here do
func jump_cut(delta):
	if vel.y < -100:
		#vel.y = -100
		vel = Vector2.DOWN * 9.81 * SHORT_JUMP_SCALE * delta
	#vel += Vector2.DOWN * 9.81 * SHORT_JUMP_SCALE * delta

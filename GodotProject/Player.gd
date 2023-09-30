# 2023-09-29
extends CharacterBody2D 

# Helpful Video: 
#   https://odysee.com/@obacodeprogramming:8/godot-tutorial-for-beginners:6

var x_dir = 0
var moving = false
var accel = 100
var maxspeed = 125
var friction = 50

var y_dir = 0
var jumping = false
var jump_speed = 1000
var gravity = 250


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	## Controls ##
	# Movement
	if Input.is_action_pressed("ui_left"): 
		moving = true
		velocity.x += -accel * delta
		
	if Input.is_action_pressed("ui_right"):
		moving = true 
		velocity.x += accel * delta
		
	if Input.is_action_pressed("ui_up"): 
		if !jumping:
			jumping = true
			velocity.y += -jump_speed * delta
			
	if Input.is_action_pressed("ui_down"): 
		velocity.y += accel * delta
		
	# Combat
	#TBD
	
	## Friction ##
	
	if velocity.x != 0:
		x_dir = velocity.x / abs(velocity.x)
		velocity.x += friction * -x_dir * delta
		if round(velocity.x) == 0:
			velocity.x = 0
			x_dir = 0
			moving = false
	
	## Gravity ##
	
	if velocity.y != 0:
		y_dir = velocity.y / abs(velocity.y)
		if round(velocity.y) == 0:
			velocity.y = 0
			y_dir = 0
		if jumping:
			velocity.y -= gravity * -x_dir * delta
	else:
		jumping = false
		
	## Speed Limits ##
	
	if abs(velocity.x) > maxspeed:
		velocity.x = maxspeed * x_dir
		
	if abs(velocity.y) > maxspeed:
		velocity.y = maxspeed * y_dir
	
	move_and_slide()
	
	print_debug("X Dir = " + str(x_dir) + ", X Speed = " + str(velocity.x))
	print_debug("Y Dir = " + str(y_dir) + ", Y Speed = " + str(velocity.y))
	
	pass

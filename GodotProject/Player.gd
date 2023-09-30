extends Node2D 

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	#velocity.y += 100 * delta
	#y += 100 * delta
	if Input.action_press("ui_left"): 
		move_local_x(-100)
	if Input.action_press("ui_right"): 
		move_local_x(100)
	if Input.action_press("ui_up"): 
		move_local_y(-100)
	if Input.action_press("ui_down"): 
		move_local_y(100)
	pass

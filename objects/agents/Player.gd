extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var horizontal_velocity = 150
var jump_velocity = 100
var velocity = Vector2()

var gravity = 90

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func handle_movement(delta):
	
	velocity += gravity * delta * Vector2.DOWN
	
	if Input.is_action_pressed("move_left"):
		velocity.x = -horizontal_velocity
	elif Input.is_action_pressed("move_right"):
		velocity.x = horizontal_velocity
	else:
		velocity.x = 0

	if is_on_floor() and Input.is_action_just_pressed("move_jump"):
		velocity.y = -jump_velocity
	
	velocity = move_and_slide(velocity, Vector2.UP)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	handle_movement(delta)
	pass

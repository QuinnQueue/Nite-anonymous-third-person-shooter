extends CharacterBody3D

const JUMP_VELOCITY = 4.5

var speed = 3.2
var running_speed = 8
var walking_speed = 3.0
var is_running = false
@onready var camera_mount = $Camera_Mount
@onready var animation_player = $Visuals/mixamo_base/AnimationPlayer
@onready var visuals = $Visuals
@export var horizontal_sensitvity = 0.5
@export var vertical_sensitvity = 0.5
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")



func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		# Rotates player on y axis from mouse movement on the x axis
		rotate_y(deg_to_rad(-event.relative.x * horizontal_sensitvity))
		# This line prevents the character from turning only with the mouse
		visuals.rotate_y(deg_to_rad(event.relative.x * horizontal_sensitvity))
		
		camera_mount.rotate_x(deg_to_rad(-event.relative.y * vertical_sensitvity))
		
func _physics_process(delta):
	if Input.is_action_pressed("running"):
		speed = running_speed
		is_running = true
	else:
		speed = walking_speed
		is_running = false
		
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		if is_running:
			if(animation_player.current_animation != "running"):
				animation_player.play("running")
		else:
			if(animation_player.current_animation != "walking" ):
				animation_player.play("walking")
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		
		# model will look at direction we are walking
		visuals.look_at(position + direction)
	else:
		if(animation_player.current_animation != "idle"):
			animation_player.play("idle")
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()


func get_camera_transform():
	return camera_mount.get_child(0).transform()

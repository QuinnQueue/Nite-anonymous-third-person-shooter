class_name Player
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

@onready
var state_machine = $State_Machine

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	state_machine.init(self)


func _input(event):
	if event is InputEventMouseMotion:
		# Rotates player on y axis from mouse movement on the x axis
		rotate_y(deg_to_rad(-event.relative.x * horizontal_sensitvity))
		# This line prevents the character from turning only with the mouse
		visuals.rotate_y(deg_to_rad(event.relative.x * horizontal_sensitvity))
		
		camera_mount.rotate_x(deg_to_rad(-event.relative.y * vertical_sensitvity))
		
func _physics_process(delta):
	state_machine.process_physics(delta)
	# This is currently not active
	if Input.is_action_pressed("running"):
		speed = running_speed
		is_running = true
	else:
		speed = walking_speed
		is_running = false


func get_camera_transform():
	return camera_mount.get_child(0).transform()
	
func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)


func _process(delta: float) -> void:
	state_machine.process_frame(delta)

class_name State
extends Node

@export
var animation_name: String
@export
var move_speed: float = 400

@export 
var speed = 3.2
@export 
var running_speed = 8
@export 
var walking_speed = 3.0
@export 
var is_running = false

var gravity: int = ProjectSettings.get_setting("physics/3d/default_gravity")

## Hold a reference to the parent so that it can be controlled by the state
var parent: Player

func enter() -> void:
	parent.animation_player.play(animation_name)

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null

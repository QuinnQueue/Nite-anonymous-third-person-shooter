extends Node3D

@export
var starting_state: State

var current_state: State

# State machine passes a parent reference to each child reference.
func init(parent: Player) -> void:
	for child in get_children():
		child.parent = parent

	change_state(starting_state)
	print("Starts at")
	print(starting_state.name)
	

# Calls exit logic before changing to new state
func change_state(new_state: State) -> void:
	if current_state:
		current_state.exit()
		
	current_state = new_state
	current_state.enter()
	print("Changes to ")
	print(current_state.name)
	

func process_input(event: InputEvent) -> void:
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)


func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)
		
		
# Pass through functions for the Player to call,
# handling state changes as needed.
func process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)

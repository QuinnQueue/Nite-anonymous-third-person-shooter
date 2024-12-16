extends State

@export
var fall_state: State
@export
var jump_state: State
@export
var move_state: State

# Called when the node enters the scene tree for the first time.
func enter() -> void:
	super()
	parent.velocity.x = 0

func process_input(event: InputEvent) -> State:
	print("processing idle")
	if Input.is_action_just_pressed("jump") and parent.is_on_floor():
		return jump_state
	if Input.is_action_just_pressed('left') or Input.is_action_just_pressed('right') \
		or Input.is_action_just_pressed('backward') or Input.is_action_just_pressed('forward'):
		return move_state
	return null

func process_physics(delta: float) -> State:
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall_state
	return null

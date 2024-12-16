extends State

@export
var fall_state: State
@export
var idle_state: State
@export
var jump_state: State

func process_input(event: InputEvent) -> State:
	
	if Input.is_action_just_pressed('jump') and parent.is_on_floor():
		return jump_state
	return null

func process_physics(delta: float) -> State:
	print("I am currently in move state")
	# Get the input direction and handle the movement/deceleration.
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	if input_dir == Vector2.ZERO:
		parent.velocity.x = 0
		parent.velocity.z = 0
		return idle_state
	var direction = (parent.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	parent.velocity.x = direction.x * speed
	parent.velocity.z = direction.z * speed

	# model will look at direction we are walking
	parent.visuals.look_at(parent.position + direction)
	parent.move_and_slide()
	if !parent.is_on_floor():
		return fall_state
		
	return null

extends State

@export
var fall_state: State
@export
var idle_state: State
@export
var move_state: State

@export
var jump_force: float = 4.5

func enter() -> void:
	super()
	parent.velocity.y = jump_force

func process_physics(delta: float) -> State:
	parent.velocity.y -= gravity * delta
	
	if parent.velocity.y > 0:
		return fall_state
	
	var movement = Input.get_axis('left', 'right') * move_speed
	
	parent.velocity.x = movement
	parent.move_and_slide()

	if parent.is_on_floor():
		if movement != 0:
			return move_state
		return idle_state
	
	return null

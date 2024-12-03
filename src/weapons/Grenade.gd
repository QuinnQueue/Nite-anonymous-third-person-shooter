extends Node3D
## ProgressBarPlaceholder is not final!
## The UI will ultimately handle anything to do with that, but it is good for the
## test scene to visualize the throw charge-up.

@export var throw_speed_max := 25.0
@export var throw_threshold := 0.25 # minimum ready amount to throw

var _progress : float
var _delta : float
var _shoot_pressed : bool


func _process(delta):
	if _shoot_pressed:
		_progress += delta
		_progress = clamp(_progress, 0.0, 1.0)
		$ProgressBarPlaceholder.show()
		$ProgressBarPlaceholder.value = _progress * 100
		
	else:
		$ProgressBarPlaceholder.hide()
		_progress = 0.0


func shoot_pressed():
	_shoot_pressed = true


func shoot_released():
	_shoot_pressed = false
	if _progress >= 0.25:
		_shoot(_progress)
	
	$ProgressBarPlaceholder.hide()
	_progress = 0.0


func _shoot(speed_factor):
	# throw submunition
	var inst = preload("res://src/weapons/Submunition.tscn").instantiate()
	inst.top_level = true
	
	
	add_child(inst)
	inst.global_position = $Marker3D.global_position
	inst.linear_velocity = $Marker3D.global_basis.z * -1 * throw_speed_max * speed_factor
	inst.throw()

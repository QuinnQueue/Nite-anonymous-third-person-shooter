extends Node3D

@export var mouse_sensitivity = 0.01
@export var upper_limit_degrees = 90
@export var lower_limit_degrees = -90

func _input(event: InputEvent) -> void:
	if Input.mouse_mode != Input.MOUSE_MODE_CAPTURED:
		return
	
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		$VBase.rotate_x(-event.relative.y * mouse_sensitivity)
	
	$VBase.rotation_degrees.x = clamp($VBase.rotation_degrees.x, lower_limit_degrees, upper_limit_degrees)


func get_camera_global_transform() -> Transform3D:
	return $VBase/Camera3D.global_transform


func capture_mouse() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func release_mouse() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func set_fov(deg : float) -> void:
	$VBase/Camera3D.fov = deg


func get_fov() -> float:
	return $VBase/Camera3D.fov

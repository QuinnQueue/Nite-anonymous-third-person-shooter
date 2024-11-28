extends Node3D

@export var default_zoom = 4.0 # default units back from center point
@export var mouse_sensitivity = 0.01

func _ready() -> void:
	$VBase/Camera3D.position.z = default_zoom


func _input(event: InputEvent) -> void:
	#if Input.is_action_pressed("rmb"):
		#return
	
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		$VBase.rotate_x(-event.relative.y * mouse_sensitivity)
	
	$VBase.rotation_degrees.x = clamp($VBase.rotation_degrees.x, -90, 90)


func get_camera_global_transform() -> Transform3D:
	return $VBase/Camera3D.global_transform


func set_fov(deg : float) -> void:
	$VBase/Camera3D.fov = deg


func get_fov() -> float:
	return $VBase/Camera3D.fov

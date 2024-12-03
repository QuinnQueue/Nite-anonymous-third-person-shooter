extends Node3D

@export var mouse_sensitivity = 0.01
@export var upper_limit_degrees = 90
@export var lower_limit_degrees = -90
@export var camera_collision_padding = 0.15 # meters to keep the camera away from layer 1 objects

@onready var camera_distance = $VBase/Camera3D.position.z

func _ready():
	$VBase/RayCast3D.target_position = $VBase/Camera3D.position
	$VBase/RayCast3D.target_position += Vector3.BACK * camera_collision_padding


func _input(event: InputEvent) -> void:
	if Input.mouse_mode != Input.MOUSE_MODE_CAPTURED:
		return
	
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		$VBase.rotate_x(-event.relative.y * mouse_sensitivity)
	
	$VBase.rotation_degrees.x = clamp($VBase.rotation_degrees.x, lower_limit_degrees, upper_limit_degrees)


func _process(delta):
	$VBase/RayCast3D.force_raycast_update()
	if $VBase/RayCast3D.is_colliding():
		var p : Vector3 = $VBase/RayCast3D.get_collision_point()
		var r : Vector3 = p - $VBase/RayCast3D.global_transform.origin
		var d = r.length()
		
		$VBase/Camera3D.position.z = d - camera_collision_padding
	else:
		$VBase/Camera3D.position.z = camera_distance


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

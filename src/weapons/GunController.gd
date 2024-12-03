extends Node3D

@export var weapon_aim_speed = 0.1

var b := false
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		b = not b
		if b:
			$CameraController.capture_mouse()
		else:
			$CameraController.release_mouse()
	
	var gun = get_gun()
	if gun:
		if Input.is_action_pressed("shoot"):
			gun.shoot_pressed()
		if Input.is_action_just_released("shoot"):
			gun.shoot_released()
	
	if Input.is_action_pressed("rmb"):
		$HBase.rotation.y = lerp_angle($HBase.rotation.y, $CameraController.rotation.y, weapon_aim_speed)
		$HBase/VBase.rotation.x = lerp_angle($HBase/VBase.rotation.x, $CameraController/VBase.rotation.x, weapon_aim_speed)


func get_gun():
	return get_node_or_null("HBase/VBase/Gun")


func set_gun(gun_inst):
	assert($HBase/VBase.get_child_count() == 0)
	
	$HBase/VBase.add_child(gun_inst)
	gun_inst.name = "Gun"

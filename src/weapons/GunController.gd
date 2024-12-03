class_name GunController
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
		var target = $CameraController.get_camera_centered_target()
		
		if target and gun:
			# Slew the weapon to the specific target at the center of the camera, in the world.
			
			var offset = Vector3.ZERO
			if gun.has_method('get_weapon_offset'):
				offset = gun.get_weapon_offset()
			var source_pos = get_gun().global_position + offset
			$Looker.look_at_from_position(source_pos, target, Vector3.UP)
			var r : Vector3 = target - $HBase.global_position
			
			var forward = (-$HBase.global_basis.z)
			var forward_vert = (-$HBase/VBase.global_basis.z)
			
			var sign_ = sign(r.y)
			$HBase.rotation.y = lerp_angle($HBase.rotation.y, $Looker.rotation.y, weapon_aim_speed)
			$HBase/VBase.rotation.x = lerp_angle($HBase/VBase.rotation.x, $Looker.rotation.x, weapon_aim_speed)
		else:
			# Otherwise, slew the gun to just align in parallel with the camera aim direction.
			
			$HBase.rotation.y = lerp_angle($HBase.rotation.y, $CameraController.rotation.y, weapon_aim_speed)
			$HBase/VBase.rotation.x = lerp_angle($HBase/VBase.rotation.x, $CameraController/VBase.rotation.x, weapon_aim_speed)


func get_gun():
	return get_node_or_null("HBase/VBase/Gun")


func set_gun(gun_inst):
	for child in $HBase/VBase.get_children():
		$HBase/VBase.remove_child(child)
	
	$HBase/VBase.add_child(gun_inst)
	gun_inst.name = "Gun"

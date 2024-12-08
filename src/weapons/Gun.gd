extends Node3D
## ReticlePlaceholder is not meant for production.
## It is more just meant for debugging!

func shoot_pressed():
	$RayCast3D.force_raycast_update()
	var t = $RayCast3D.get_collider()
	if $RayCast3D.is_colliding():
		t.hit()


func shoot_released():
	pass


func get_weapon_offset():
	return $RayCast3D.global_position - self.global_position

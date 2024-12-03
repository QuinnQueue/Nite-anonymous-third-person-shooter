extends Node3D

func shoot_pressed():
	$RayCast3D.force_raycast_update()
	var t = $RayCast3D.get_collider()
	if $RayCast3D.is_colliding():
		t.hit()


func shoot_released():
	pass

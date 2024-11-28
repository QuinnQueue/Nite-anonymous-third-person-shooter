extends Node3D


func shoot():
	var target = $RayCast3D.get_collider()
	if target:
		target.hit()

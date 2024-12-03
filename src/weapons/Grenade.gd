extends Node3D

func shoot():
	# throw submunition
	var inst = preload("res://src/weapons/Submunition.tscn").instantiate()
	inst.top_level = true
	#$Marker3D.top_level = true
	
	inst.global_transform = $Marker3D.global_transform
	inst.linear_velocity = $Marker3D.global_basis.z * -1 * 20
	
	inst.throw()

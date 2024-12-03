extends RigidBody3D

var is_primed = false

func throw():
	$Timer.start()
	$Timer.timeout.connect(func(): is_primed = true)




func _on_body_entered(body):
	if is_primed:
		# boom
		var hitboxes = $Area3D.get_overlapping_areas()
		
		for hitbox in hitboxes:
			hitbox.hit()

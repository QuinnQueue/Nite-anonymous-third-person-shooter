extends Node3D

var b := false

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		b = not b
		if b:
			$CameraController.capture_mouse()
		else:
			$CameraController.release_mouse()

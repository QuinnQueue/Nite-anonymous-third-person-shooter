extends Area3D


var health = 1000


func _ready() -> void:
	_update()


func hit():
	health -= 17
	_update()


func _update():
	$Label3D.text = "%d" % int(health)

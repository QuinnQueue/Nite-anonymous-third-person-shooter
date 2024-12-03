extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var gun = preload("res://src/weapons/Gun.tscn").instantiate()
	$GunController.set_gun(gun)

extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var grenade_thrower = preload("res://src/weapons/Grenade.tscn").instantiate()
	$GunController.set_gun(grenade_thrower)

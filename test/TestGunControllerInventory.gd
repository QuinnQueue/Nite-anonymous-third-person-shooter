extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var grenade_thrower = preload("res://src/weapons/Grenade.tscn").instantiate()
	var gun = preload("res://src/weapons/Gun.tscn").instantiate()
	
	$Inventory.add_gun(gun)
	$Inventory.add_gun(grenade_thrower)
	$Inventory.gun_controller = $GunController
	

func _process(delta):
	if Input.is_action_just_pressed("ui_focus_next"):
		$Inventory.next_gun()

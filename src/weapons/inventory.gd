extends Node3D

var inventory = []
var i = 0
var gun_controller : GunController

func add_gun(gun_inst):
	inventory.append(gun_inst)


func next_gun():
	if len(inventory) == 0:
		return
	
	i += 1
	i = i % len(inventory)
	
	var gun = inventory[i]
	gun_controller.set_gun(gun)

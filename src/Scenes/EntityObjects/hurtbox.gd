extends Area3D

@export var hitbox_damage_multiplier : float = 1.0
@export_enum("Head", "Body", "Limb") var hitbox_type : String = "Head"

signal damage_dealt(damage)

func PLACEHOLDER_damage_calculation(bullet):
	#Do some match using some shit from the bullet then emit a signal
	var damage = null;
	
	
	if(damage != null):
		emit_signal("damage_done")

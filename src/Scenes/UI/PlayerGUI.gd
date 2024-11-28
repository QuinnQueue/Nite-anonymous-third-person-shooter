extends Control


@onready var placeholder_ammo_label = %Placeholder_AmmoLabel
@onready var placeholder_health_bar = %Placeholder_HealthBar
@onready var placeholder_misc_bar = %Placeholder_MiscBar


##Sets text for ammo
func set_ammo_text(gun):
	
	var current_clip = gun.current_clip
	var clip_size = gun.clip_size
	var remaining_ammo = gun.remaining_ammo
	var ammo_capacity = gun.ammo_capacity
	
	placeholder_ammo_label.text = "Ammo: %s / %s | Total Ammo: %s / %s" % [str(current_clip), str(clip_size), str(remaining_ammo), str(ammo_capacity)]


##Sets health bar value
func set_healthbar(health : float):
	placeholder_health_bar.value = health

##Sets misc bar value
func set_misc(misc_value : float):
	placeholder_health_bar.value = misc_value

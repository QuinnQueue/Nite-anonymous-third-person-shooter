extends Node

var minimum_volume = -72.0
var max_volume = 0.0

var master_volume : float = 1.0 : set = set_master_volume
func set_master_volume(value : float) -> void:
	var bus = AudioServer.get_bus_index("Master")
	master_volume = value
	AudioServer.set_bus_volume_db(bus, lerp(minimum_volume, max_volume, master_volume))

var effects_volume : float = 1.0 : set = set_effects_volume
func set_effects_volume(value : float) -> void: 
	var bus = AudioServer.get_bus_index("Effects")
	effects_volume = value
	AudioServer.set_bus_volume_db(bus, lerp(minimum_volume, max_volume, effects_volume))

var ambience_volume : float = 1.0 : set = set_ambience_volume
func set_ambience_volume(value : float) -> void:
	var bus = AudioServer.get_bus_index("Ambience")
	ambience_volume = value
	AudioServer.set_bus_volume_db(bus, lerp(minimum_volume, max_volume, effects_volume))

var music_volume : float = 1.0 : set = set_music_volume
func set_music_volume(value : float) -> void: 
	var bus = AudioServer.get_bus_index("Music")
	music_volume = value
	AudioServer.set_bus_volume_db(bus, lerp(minimum_volume, max_volume, effects_volume))

func _ready():
	AudioServer.get_bus_index("Master")

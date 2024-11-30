extends Control

@onready var master_slider = %"Master Slider"
@onready var effects_slider = %"Effects Slider"
@onready var music_slider = %"Music Slider"
@onready var ambience_slider = %"Ambience Slider"

@onready var PLACEHOLDER_button_holder = %Placeholder_Button_Holder
@onready var PLACEHOLDER_options_menu = $".."


func _on_master_slider_value_changed(value):
	AudioManager.master_volume = value


func _on_effects_slider_value_changed(value):
	AudioManager.effects_volume = value


func _on_music_slider_value_changed(value):
	AudioManager.music_volume = value

func _on_ambience_slider_value_changed(value):
	AudioManager.ambience_volume = value


func _on_back_button_pressed():
	PLACEHOLDER_options_menu.visible = false
	PLACEHOLDER_button_holder.visible = true




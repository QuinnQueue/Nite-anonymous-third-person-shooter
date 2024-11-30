extends Control

@export var start_scene : String
var open : bool = false

@onready var placeholder_button_holder = %Placeholder_Button_Holder
@onready var placeholder_options_menu = $"PLACEHOLDER Options Menu"

func setup_all_buttons(button_holder : Node):
	for button in button_holder.get_children():
		if(!button is Button):
			printerr("main menu.gd : ONLY BUTTONS UNDER HERE CHIEF")
			return
		else:
			var button_function = get("PLACEHOLDER_"+button.name)
			if(button_function != null):
				button.pressed.connect(button_function)

func _ready():
	setup_all_buttons(placeholder_button_holder)

##Changes to start scene using a path
func PLACEHOLDER_start(_start_scene : String = start_scene):
	if(_start_scene == ""):
		printerr("THERE IS NO START SCENE")
		return
	get_tree().change_scene_to_file(_start_scene)

func PLACEHOLDER_options():
	placeholder_button_holder.visible = false
	placeholder_options_menu.visible = true
	var c = create_tween()
	c.tween_property(placeholder_options_menu, "modulate:a", 1.0, 0.5).from(0).set_ease(Tween.EASE_OUT)

func PLACEHOLDER_exit():
	get_tree().quit()

extends Control

var input_vector = Vector2.ZERO
@export var stick_size = 100
@export var center_size = 250

@export var center_color = Color.GRAY
@export var stick_color = Color.DARK_SLATE_GRAY

func _process(delta):
	input_vector = Vector2(Input.get_joy_axis(0, JOY_AXIS_LEFT_X), Input.get_joy_axis(0, JOY_AXIS_LEFT_Y))
	print(Input.get_gyroscope())
	queue_redraw()

func _draw():
	draw_circle(size/2, center_size, center_color)
	draw_circle(size/2 + input_vector * stick_size * 1.5, stick_size, stick_color)
	draw_line(size/2, size/2 + input_vector * stick_size, stick_color, 50)

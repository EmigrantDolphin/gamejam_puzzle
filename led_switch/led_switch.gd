extends Area2D

@export var led_configurator: Control
@export var led_strip: Sprite2D
@export var overlay_rect: ColorRect

signal led_switch_solved(solved: bool)

var solvedRed = 32
var solvedGreen = 87
var solvedBlue = 61

var uv_color = Color(123 / 255.0, 109 / 255.0, 141 / 255.0)

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		led_configurator.show()


func _on_led_configurator_led_colors_submitted(red, green, blue):
	print('red: ' + str(red) + ', green: ' + str(green) + ', blue: ' + str(blue))
	if red == solvedRed and blue == solvedBlue and green == solvedGreen:
		led_switch_solved.emit(true)
		led_strip.modulate = uv_color
		overlay_rect.modulate = uv_color
	else:
		var r = red * 255 / 99
		var g = green * 255 / 99
		var b = blue * 255 / 99
		led_strip.modulate = Color(r / 255.0, g / 255.0, b / 255.0)
		overlay_rect.modulate = Color(r / 255.0, g / 255.0, b / 255.0)
		led_switch_solved.emit(false)


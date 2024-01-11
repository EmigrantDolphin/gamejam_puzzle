extends Area2D

@export var led_configurator: Control
@export var led_strip: Sprite2D
@export var overlay_rect: ColorRect

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		led_configurator.show()


func _on_led_configurator_led_colors_submitted(red, green, blue):
	print('red: ' + str(red) + ', green: ' + str(green) + ', blue: ' + str(blue))
	led_strip.modulate = Color(red / 255.0, green / 255.0, blue / 255.0)
	overlay_rect.modulate = Color(red / 255.0, green / 255.0, blue / 255.0)
	#TODO: set bool for UV light somewhere

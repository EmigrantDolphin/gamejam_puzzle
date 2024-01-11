extends Control

signal led_colors_submitted(red: int, green: int, blue: int)

var red: int
var green: int
var blue: int

func _on_submit_pressed():
	led_colors_submitted.emit(red, green, blue)
	hide()


func _on_red_on_number_change(number): # number is 0 - 99. Spaghetti code but oh well
	red = number * 255 / 99


func _on_green_on_number_change(number):
	green = number * 255 / 99


func _on_blue_on_number_change(number):
	blue = number * 255 / 99

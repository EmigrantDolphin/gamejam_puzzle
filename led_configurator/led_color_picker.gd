extends Control

signal on_number_change(number: int)

var whole_number = 0;


func _on_first_number_on_number_change(value):
	whole_number = (whole_number % 10) + (value * 10)
	on_number_change.emit(whole_number)


func _on_second_number_on_number_change(value):
	whole_number = whole_number / 10 * 10 + value
	on_number_change.emit(whole_number)

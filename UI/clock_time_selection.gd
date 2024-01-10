extends Control

signal timeSelected(minutes)

var firstNumber: int
var secondNumber: int
var thirdNumber: int
var fourthNumber: int

func _on_first_number_on_number_change(value):
	firstNumber = value


func _on_second_number_on_number_change(value):
	secondNumber = value


func _on_third_number_on_number_change(value):
	thirdNumber = value


func _on_fourth_number_on_number_change(value):
	fourthNumber = value


func _on_submit_pressed():
	var hour = firstNumber * 10 + secondNumber
	var minutes = hour * 60 + (thirdNumber * 10 + fourthNumber)
	timeSelected.emit(minutes)
	hide()


func _on_clock_clock_pressed():
	show()

extends Node2D

signal ledSwitchSolved(solved: bool)
signal clockSolved(solved: bool)

@export var dialogueSystem: Control

var isClockSolved = false
var isLedSwitchSolved = false
var isStarCircleSolved = false

# track states here. When all are done, trigger win condition


func _on_led_switch_led_switch_solved(solved):
	isLedSwitchSolved = solved
	print('led switch solved')
	print(solved)
	try_process_win()


func _on_clock_clock_solved(solved):
	isClockSolved = solved
	print('clock solved')
	print(solved)
	try_process_win()


func _on_star_circle_star_circle_solved(solved):
	isStarCircleSolved = solved
	print('star circle solved')
	print(solved)
	try_process_win()

func try_process_win():
	if (isLedSwitchSolved and isClockSolved and isStarCircleSolved):
		dialogueSystem.displayListOfText([{text = "Congratz!"}, {text = "You win kek"}])

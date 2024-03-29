extends Area2D

signal clockPressed()
signal clockReset()
signal timeSelected(minutes, areStarsAlligned)
signal clockSolved(solved: bool)

var lastSelectedMinutes = 5
var endOfNightMinutes = 6*60

var solvedMinues = 2 * 60 + 47

@export var dialogueNode: Control

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		clockPressed.emit()

func _ready():
	rotateArrows(lastSelectedMinutes)


func _on_clock_time_selection_time_selected(minutes):
	if (minutes < lastSelectedMinutes or minutes > endOfNightMinutes):
		printEndOfNight(minutes)
		rotateArrows(6 * 60)
		return

	rotateArrows(minutes)

	if (minutes == solvedMinues):
		clockSolved.emit(true)
	else:
		clockSolved.emit(false)

	lastSelectedMinutes = minutes
	timeSelected.emit(minutes)

func rotateArrows(minutes):
	var hour = minutes / 60
	var minute = minutes - (hour * 60)

	var hourTwelve = hour - 12 if hour > 12 else hour
	
	print(hourTwelve)
	print(minute)

	var shortAngle = 360.0 / 12.0 * hourTwelve
	var longAngle = 360.0 / 60.0 * minute

	print(shortAngle)
	print(longAngle)
	$Long.rotation = longAngle * PI / 180
	$Short.rotation = shortAngle * PI / 180


func printEndOfNight(_minutes):
	var text = "You've been waiting until 6:00. And then you suddenly realized - it's almost time for your day shift, so you have to go.
	But it's important to investigate this disappearance of a girl, you will have to come back here in the evening.
	The kid might be starving to death, but oh well, you've been waiting the whole night anyways. Surely she will be fine."

	var textObj = {
		text = text,
		callback = func():
			clockReset.emit() 
			lastSelectedMinutes = 5
			timeSelected.emit(5)
			rotateArrows(5)
	}
	dialogueNode.displayListOfText([textObj])

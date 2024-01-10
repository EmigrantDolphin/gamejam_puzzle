extends Area2D

signal clockPressed()
signal timeSelected(minutes, areStarsAlligned)

var starsAlignedMinutes = 163
var lastSelectedMinutes = 5
var endOfNightMinutes = 6*60

@export var dialogueNode: Control

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		clockPressed.emit()


func _on_clock_time_selection_time_selected(minutes):
	if (minutes < lastSelectedMinutes or minutes > endOfNightMinutes):
		printEndOfNight(minutes)
		return

	lastSelectedMinutes = minutes
	var areStarsAlligned = minutes == starsAlignedMinutes
	timeSelected.emit(minutes, areStarsAlligned)


func printEndOfNight(minutes):
	var hours = minutes / 60
	var leftoverMinutes = minutes - (hours * 60)
	#todo: this is if you go overboard. Past 06 or something?
	dialogueNode.displayListOfText(["You've been waiting until %02.f:%02.f. It's almost time for your day shift, so you have to go.
	But it's important to investigate this disappearance of a child, you will have to come back here in the evening.
	The kid might be starving to death, but oh well, you've been waiting the whole night anyways. Surely he will be fine." % [hours, leftoverMinutes]])

extends Control

signal onNumberChange(value: int)

@export var minValue: int = 0
@export var maxValue: int = 6
@export var currentValue: int = 0

var initialValue = 0;

func reset():
	currentValue = initialValue
	$Label.text = str(currentValue)
	onNumberChange.emit(currentValue)

# Called when the node enters the scene tree for the first time.
func _ready():
	initialValue = currentValue
	$Label.text = str(currentValue)
	onNumberChange.emit(currentValue)


func _on_increase_pressed():
	if currentValue + 1 > maxValue:
		currentValue = minValue
	else:
		currentValue += 1
	$Label.text = str(currentValue)
	onNumberChange.emit(currentValue)


func _on_decrease_pressed():
	if currentValue - 1 < minValue:
		currentValue = maxValue
	else:
		currentValue -= 1
	$Label.text = str(currentValue)
	onNumberChange.emit(currentValue)
	

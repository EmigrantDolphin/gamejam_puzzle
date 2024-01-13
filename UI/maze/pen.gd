extends Area2D

signal end_reached

var isDragging = false
var won = false

var checkpointOneReached = false
var checkpointTwoReached = false
var checkpointThreeReached = false

@export var finalPosition: Vector2

var initialPosition: Vector2

func _ready():
	initialPosition = position

func _on_mouse_entered():
	if won:
		return
	if position != initialPosition:
		return
	isDragging = true


func _on_metal_mouse_entered():
	if won:
		return
	isDragging = false
	position = initialPosition
	reset_checkpoints()
	print('reset')


func _input(event):
	if won:
		return
	if isDragging and event is InputEventMouse:
		position = event.position - get_parent().position


func _on_end_mouse_entered():
	if won:
		return
	if isDragging and checkpointOneReached and checkpointTwoReached and checkpointThreeReached:
		end_reached.emit()
		isDragging = false
		won = true
		position = finalPosition
	else:
		isDragging = false
		position = initialPosition
		reset_checkpoints()


func reset_checkpoints():
	checkpointOneReached = false
	checkpointTwoReached = false
	checkpointThreeReached = false

func _on_checkpoint_one_mouse_entered():
	checkpointOneReached = true
	print('checkpoint 1')


func _on_checkpoint_two_mouse_entered():
	checkpointTwoReached = true
	print('checkpoint 2')


func _on_checkpoint_three_mouse_entered():
	checkpointThreeReached = true
	print('checkpoint 3')

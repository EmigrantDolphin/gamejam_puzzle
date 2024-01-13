extends Area2D

signal picture_puzzle_pressed


func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		picture_puzzle_pressed.emit()

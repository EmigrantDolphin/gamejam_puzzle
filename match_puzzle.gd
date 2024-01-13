extends Area2D

signal match_puzzle_pressed

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		match_puzzle_pressed.emit()

extends Area2D

signal maze_poster_clicked

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		maze_poster_clicked.emit()

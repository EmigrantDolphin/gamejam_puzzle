extends Area2D

signal clicked(markPosition: Vector2)


func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		print("star mark clicled")
		clicked.emit(global_position)

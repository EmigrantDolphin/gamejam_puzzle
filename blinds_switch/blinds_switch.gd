extends Area2D

@export var blinds: Sprite2D

var areBlindsOpen = false


func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if areBlindsOpen:
			blinds.show()
		else:
			blinds.hide()
		areBlindsOpen = !areBlindsOpen


extends Area2D

@export var blinds: Sprite2D

var areBlindsOpen = false

func _ready():
	areBlindsOpen = !blinds.hidden


func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		if areBlindsOpen:
			blinds.hide()
		else:
			blinds.show()
		areBlindsOpen = !areBlindsOpen


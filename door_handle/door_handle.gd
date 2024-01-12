extends Area2D

@export var dialogue_system: Control

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		dialogue_system.displayListOfText([
			{
				text = 'I just got here. I should look for more clues to figure out why and where the kid disappeared.'
			}
		])

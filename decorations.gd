extends Node2D

@export var dialogue_system: Control


func _on_flower_1_input_event(viewport, event, shape_idx):
	if is_pressed(event):
		display("This is a well taken care of plant.")


func is_pressed(event):
	return event is InputEventMouseButton and event.pressed and event.button_index == 1

func display(text): 
	dialogue_system.displayListOfText([
		{
			text = text
		}
	])


func _on_chair_input_event(viewport, event, shape_idx):
	if is_pressed(event):
		display("A very comfortable chair. Mmm... I need that in my office")


func _on_poster_input_event(viewport, event, shape_idx):
	if is_pressed(event):
		display("A very nice poster. Looks like Saturn.")

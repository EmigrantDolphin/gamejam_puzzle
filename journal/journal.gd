extends Area2D

@export var dialogue_system: Control

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		read_journal()

func read_journal():
	dialogue_system.displayListOfText([
		{ text = journalIntro },
		{ text = 'The last written dream says...'},
		{ text = firstDream, isDiary = true },
		{ text = tornPages }
	])

var journalIntro = 'This is the girls journal. It says "Dream Journal" on the cover. Her parents [i]did[/i] mention that she was into dream analysis. Maybe there is something here.'
var firstDream = "2024-01-12. The dream was very vivid. I was on, what felt like, a different planet. It had air, good temperature and similar gravity to earth. Everything looked alien but also so beautiful. I didn't recognize any plants, but there were many. Animals I've never seen before. And these humanoid looking aliens, they wore clothing and were paying attetion to me. They gestured to me. It felt like they were inviting me to come. To connect.
Note: I keep thinking about this dream. Usually I forget my dreams after a few minutes. But not this one. That's very unusual. I wonder what it means..."
var tornPages = "Next three pages are torn out. Maybe I can find them somewhere in the room."

extends Control

@export var dialogue_system: Control

var won = false

func _on_pen_end_reached():
	print_won_text()
	won = true


func _on_maze_poster_maze_poster_clicked():
	show()
	if won:
		print_won_text()


func _on_close_pressed():
	hide()

func print_won_text():
	dialogue_system.displayListOfText([
		{
			text = "When I solved the puzzle, I heard something click. A section opened on the back of the puzzle. I found a torn piece of paper that reads..."
		},
		{
			text = "2024-01-15. I dreamed about the aliens again. This time they showed me some sort of a sculpture or a mechanism that looked like an empty circle. In the middle of the circle was the star constellation I saw in my previous dream. It felt like this circle is part of something they want me to understand.
			Note: I drew a circle on my blinds with invisible ink, so my parents don't get mad at me. It's visible with LED switch set to red: 32, green: 87, blue: 61. I set it up to use UV light with these values."
		}
	])

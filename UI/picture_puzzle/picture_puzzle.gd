extends Control

@export var puzzle_items: Array[Control]
@export var dialogue_system: Control

var neighbors = [
	[1, 3],
	[0, 2, 4],
	[1, 5],
	[0, 4, 6],
	[1, 3, 5, 7],
	[2, 4, 8],
	[3, 7],
	[6, 4, 8],
	[7, 5]
]

var isSolved = false


func _ready():
	for item in puzzle_items:
		item.gui_input.connect(on_item_click(int(str(item.name))))


func on_item_click(item_index):
	return func(event):
		if event is InputEventMouseButton and event.pressed and event.button_index == 1 and !isSolved:
			handle_item_shift(item_index)

func handle_item_shift(item_index):
	var item = puzzle_items[item_index]
	var item_child = item.get_child(0) as TextureRect

	if (!item_child):
		return

	var empty_neighbor_position = find_empty_neighbor(item_index)
	if (empty_neighbor_position == -1):
		return

	item_child.reparent(puzzle_items[empty_neighbor_position])
	item_child.position = Vector2(0, 0)

	try_win()


func find_empty_neighbor(item_index):
	print(item_index)
	print(neighbors)
	var my_neighbors = neighbors[item_index]
	for neighbor in my_neighbors:
		var neighbor_child = puzzle_items[neighbor].get_child(0)
		if !neighbor_child:
			return neighbor
	return -1

func try_win():
	for item in puzzle_items:
		if (!item.get_child(0)):
			continue
		if (item.get_child(0).name != item.name):
			return
		
	isSolved = true
	print_clue()
	

func print_clue():
	dialogue_system.displayListOfText([
		{
			text = "When you solved the puzzle, a peace of paper with torn edge fell out from it. It reads..."
		},
		{
			text = "2024-01-13. I dreamed about the alien planet again. They were inviting me to come. So I went towards them. They showed me around, but what stuck to my memory the most is how they showed me the star constellations. One constellation in particular. It felt like they wanted me to find it.
			Note: I stayed up late the night after. I was laying in my bed, looking at the stars and I found it. I found the constellation I saw in my dream! It's only visible through my window at 02:47 at night. Is it possible that they are real? And they are trying to build a connection with me?"
		}
	])

func _on_button_pressed():
	hide() #pass # Replace with function body.


func _on_picture_puzzle_picture_puzzle_pressed():
	show() 
	if isSolved:
		print_clue()
extends Control

@export var picture_items: Array[Control]
@export var dialogue_system: Control

var openPictureIndex = -1
var hiding = false
var matchesNeeded = 8
var matchesMade = 0

var alreadyMatchedIndexes = []

var won = false

func _ready():
	for i in range(picture_items.size()):
		picture_items[i].gui_input.connect(on_picture_click(i))

func on_picture_click(picture_index: int):
	return func(event):
		if (event is InputEventMouseButton and event.pressed and event.button_index == 1 and !hiding and !won and !alreadyMatchedIndexes.has(picture_index)) and openPictureIndex != picture_index:
			handle_picture(picture_index)

func handle_picture(picture_index):
	var matchName = picture_items[picture_index].get_child(0).name

	if openPictureIndex != -1: # if one is already open
		var openPictureMatchName = picture_items[openPictureIndex].get_child(0).name
		if openPictureMatchName == matchName: #if names match, keep both open
			alreadyMatchedIndexes.append(openPictureIndex)
			alreadyMatchedIndexes.append(picture_index)
			openPictureIndex = -1
			picture_items[picture_index].get_child(1).hide() # hide cover
			matchesMade += 1
			if matchesMade == matchesNeeded:
				win()
		else:
			picture_items[picture_index].get_child(1).hide() # hide cover
			hide_pictures([picture_index, openPictureIndex])
			openPictureIndex = -1
	else:
		openPictureIndex = picture_index
		picture_items[picture_index].get_child(1).hide()
		

func hide_pictures(picture_indexes):
	hiding = true
	await get_tree().create_timer(1.0).timeout
	for index in picture_indexes:
		picture_items[index].get_child(1).show() #show cover
	hiding = false


func win():
	won = true
	print_win_text()

func print_win_text():
	dialogue_system.displayListOfText([
		{
			text = "I solved the puzzle! A torn piece of paper fell out. It reads..."
		},
		{
			text = "2024-01-16. The same dream again. They welcomed me again with open arms. I felt their urge to connect with me and I wanted to connect with them too. I saw one of them come up to the circle statue/mechanism. He stood in such a way so he could see the constellation I dreamed of before. He raised his hand, did a specific motion, pointing to each star in a specific order. And then he vanished. I don't know what this means, but I feel like they want me to try it.",
			isDiary = true
			
		},
		{
			text = "Note: I added letters on the blinds with my invisible ink to mark the order of the stars he pointed at. The order that alien used was D, E, C, F, B, A, G. I think the stars have to be aligned for it to work. I'll try it this night. What if it works? Will I be the first human to build a connection with aliens? What if I'm not the first one? This is so exciting!",
			isDiary = true
		}
	])
	

func _on_match_puzzle_match_puzzle_pressed():
	if won:
		print_win_text()
	show()


func _on_button_pressed():
	hide()

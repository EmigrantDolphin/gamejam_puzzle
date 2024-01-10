extends Control

var textList = []
var waitingForInput = false


func displayListOfText(listOfText):
	for text in listOfText:
		textList.push_back(text)
	show()


func _process(_delta):
	if textList and !waitingForInput:
		$Dialogue/RichTextLabel.text = textList.pop_front() 
		waitingForInput = true


func _on_dialogue_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		waitingForInput = false
		if !textList:
			hide()


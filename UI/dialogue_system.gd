extends Control

var textList = []
var waitingForInput = false
var currentText



## { text = 'your text', callback ?= func(): return print('called after clicking on text')}
func displayListOfText(listOfText):
	for text in listOfText:
		textList.push_back(text)
	show()


func _process(_delta):
	if textList and !waitingForInput:
		currentText = textList.pop_front()
		$Dialogue/RichTextLabel.text = currentText.text
		waitingForInput = true


func _on_dialogue_gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		waitingForInput = false
		if currentText.has('callback'):
			currentText.callback.call()
			currentText = null
		if !textList:
			hide()


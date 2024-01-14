extends Control

var textList = []
var waitingForInput = false
var currentText

var isWritingToBuffer = false
var currentTextBuffer = ""

var currentLabel

## { text = 'your text', callback ?= func(): return print('called after clicking on text')}
func displayListOfText(listOfText):
	for text in listOfText:
		textList.push_back(text)
	show()

func _process(delta):
	if isWritingToBuffer:
		write_letter(delta)

	if textList and !waitingForInput:
		currentText = textList.pop_front()
		if currentText.has('isDiary'):
			currentLabel = $Dialogue/DiaryLabel
		else:
			currentLabel = $Dialogue/NormalLabel
		currentLabel.text = ""
		currentLabel.show()
		isWritingToBuffer = true
		waitingForInput = true

func write_letter(_delta):
	if currentText.text.length() > currentTextBuffer.length():
		currentTextBuffer += currentText.text[currentTextBuffer.length()]
		currentLabel.text = currentTextBuffer
	else:
		finish_writing()
		pass


func _on_dialogue_gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:

		if waitingForInput and isWritingToBuffer:
			finish_writing()
			return

		waitingForInput = false

		if currentText.has('callback'):
			currentText.callback.call()

		currentText = null
		currentLabel.text = ""
		currentLabel.hide()

		if !textList:
			hide()

func finish_writing():
	currentLabel.text = currentText.text
	isWritingToBuffer = false
	currentTextBuffer = ""

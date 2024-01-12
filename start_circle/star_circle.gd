extends Node2D

signal starCircleSolved(solved: bool)

var isClockSolved = false
var isLedSwitchSolved = false

var lines = []
var draggedLine: Line2D

var starClickOrder = []
var isStarCircleSolved = false

var solutionArray = ["d", "e", "c", "f", "b", "a", "g"]

@export var lineScene: PackedScene

func _input(event):
	if draggedLine and event is InputEventMouse:
		var pos = (event as InputEventMouse).position
		print(pos)
		draggedLine.set_point_position(1, pos)

func _on_area_2d_mouse_exited():
	if isStarCircleSolved:
		return

	if lines or draggedLine:
		if draggedLine:
			draggedLine.queue_free()
			draggedLine = null
		for line in lines:
			line.queue_free()
		lines.clear()
		print(starClickOrder)
		starClickOrder.clear()

func on_mark_clicked(markPosition):
	if isStarCircleSolved:
		return

	if draggedLine:
		lines.append(draggedLine)
		draggedLine = null

	if solutionArray == starClickOrder and isClockSolved and isLedSwitchSolved:
		isStarCircleSolved = true
		starCircleSolved.emit(true)
		return

	draggedLine = lineScene.instantiate() as Line2D
	draggedLine.add_point(markPosition)
	draggedLine.add_point(markPosition)
	get_tree().root.add_child(draggedLine)


func _on_star_mark_a_clicked(markPosition):
	starClickOrder.append('a')
	on_mark_clicked(markPosition)


func _on_star_mark_b_clicked(markPosition):
	starClickOrder.append('b')
	on_mark_clicked(markPosition)


func _on_star_mark_c_clicked(markPosition):
	starClickOrder.append('c')
	on_mark_clicked(markPosition)



func _on_star_mark_d_clicked(markPosition):
	starClickOrder.append('d')
	on_mark_clicked(markPosition)


func _on_star_mark_e_clicked(markPosition):
	starClickOrder.append('e')
	on_mark_clicked(markPosition)


func _on_star_mark_f_clicked(markPosition):
	starClickOrder.append('f')
	on_mark_clicked(markPosition)


func _on_star_mark_g_clicked(markPosition):
	starClickOrder.append('g')
	on_mark_clicked(markPosition)


func _on_clock_clock_solved(solved):
	isClockSolved = solved


func _on_led_switch_led_switch_solved(solved):
	isLedSwitchSolved = solved
	if isLedSwitchSolved:
		show()
	else:
		hide()


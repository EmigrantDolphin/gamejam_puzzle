extends Node2D

var lines = []
var draggedLine: Line2D

var starClickOrder = []
#TODO: process if order is specific order -> if time is right transition to the end of game


@export var lineScene: PackedScene

func _input(event):
	if draggedLine and event is InputEventMouse:
		var pos = (event as InputEventMouse).position
		print(pos)
		draggedLine.set_point_position(1, pos)

func _on_area_2d_mouse_exited():
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
	if (draggedLine):
		lines.append(draggedLine)
		draggedLine = null
	draggedLine = lineScene.instantiate() as Line2D
	draggedLine.add_point(markPosition)
	draggedLine.add_point(markPosition)
	get_tree().root.add_child(draggedLine)


func _on_star_mark_a_clicked(markPosition):
	on_mark_clicked(markPosition)
	starClickOrder.append('a')


func _on_star_mark_b_clicked(markPosition):
	on_mark_clicked(markPosition)
	starClickOrder.append('b')


func _on_star_mark_c_clicked(markPosition):
	on_mark_clicked(markPosition)
	starClickOrder.append('c')



func _on_star_mark_d_clicked(markPosition):
	on_mark_clicked(markPosition)
	starClickOrder.append('d')


func _on_star_mark_e_clicked(markPosition):
	on_mark_clicked(markPosition)
	starClickOrder.append('e')


func _on_star_mark_f_clicked(markPosition):
	on_mark_clicked(markPosition)
	starClickOrder.append('f')


func _on_star_mark_g_clicked(markPosition):
	on_mark_clicked(markPosition)
	starClickOrder.append('g')

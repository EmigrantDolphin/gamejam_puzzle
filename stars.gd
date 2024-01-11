extends Node2D

# 5 to 6*60

var maxMintues = 6 * 60
var maxDisplacement = 1382 - 903
var initialPositionX

# 903 1382

func _ready():
	initialPositionX = position.x

func _on_clock_time_selected(minutes, areStarsAlligned):
	var displacement = (minutes * maxDisplacement / maxMintues)

	position.x = initialPositionX + displacement
	#translate(Vector2(displacement, 0))

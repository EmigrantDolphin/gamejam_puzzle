extends Node2D

# 5 to 6*60

var maxMintues = 6 * 60
var maxDisplacement = 10

var lastDsiplacement = 0

func _on_clock_time_selected(minutes, areStarsAlligned):
	var displacement = (minutes * maxDisplacement / maxMintues) - lastDsiplacement

	lastDsiplacement = displacement
	translate(Vector2(displacement, 0))

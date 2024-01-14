extends Area2D

var last_position = 0.0


func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		if ($AudioPlayer.playing):
			last_position = $AudioPlayer.get_playback_position()
			$AudioPlayer.stop()
		else:
			$AudioPlayer.play(last_position)

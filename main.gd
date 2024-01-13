extends Node2D

signal ledSwitchSolved(solved: bool)
signal clockSolved(solved: bool)

@export var dialogueSystem: Control

var isClockSolved = false
var isLedSwitchSolved = false
var isStarCircleSolved = false

# track states here. When all are done, trigger win condition

func _ready():
	dialogueSystem.displayListOfText([
		{
			text = "(Mouse click to interact) (Solutions stay the same if you restart)"
		},
		{
			text = "You've been tasked with finding a missing person. The person is a 16 year old girl. She's a smart kid with high grades in school. She likes solving puzzles a lot. Her parents believe that she is a good kid, no drugs, no late night parties, it seems unlikely that she ran away."
		},
		{
			text = "Police is combing the area in case she was kidnapped. So far no witnesses and nothing on city cameras. It's as if she just disappeared."
		},
		{
			text = "Your job is to investigate the girls room and look for any clues that could help undestand what might have happened to her.",
			callback = func(): $UI/InitialBlackScreen/AnimationPlayer.play('initial_screen_fade_away')
		}
	])
	

func _on_led_switch_led_switch_solved(solved):
	isLedSwitchSolved = solved
	print('led switch solved')
	print(solved)
	try_process_win()


func _on_clock_clock_solved(solved):
	isClockSolved = solved
	print('clock solved')
	print(solved)
	try_process_win()


func _on_star_circle_star_circle_solved(solved):
	isStarCircleSolved = solved
	print('star circle solved')
	print(solved)
	try_process_win()

func try_process_win():
	if (isLedSwitchSolved and isClockSolved and isStarCircleSolved):
		$UI/FinalBlackScreen/FinalBlackScreenAnimPlayer.play('end')


func _on_final_black_screen_anim_player_animation_finished(_anim_name):
	dialogueSystem.displayListOfText([
		{
			text = "Everything went black."
		},
		{
			text = "When you open your eyes you find yourself outside."
		},
		{
			text = "You smell the air and notice it's a bit sweet."
		},
		{
			text = "You also feel lighter than before. You try jumping and you jump higher than usual."
		},
		{
			text = "You finally realize that the surroundings are also different. The plants around you and the birds in the sky, you've never seen them before!"
		},
		{
			text = "\"Hey!\" you hear someone shout. You turn around and see the girl running towards you with excitement"
		},
		{
			text = "\"I can't believe I'm not the only one here! Do you know how to get back to Earth?\" - the girl asked hopefully, with some desperation in her voice."
		},
		{
			text = "You talked to the girl for a while, she introduced you to her alien friends. They don't talk our language, but they are very patient at showing you around. The girl is hopeful that we can come back to Earth and establish a connection between the two planets. The only question that is not being answered is... How do we get back?",
			callback = func(): $UI/TheEnd/EndAnimPlayer.play('end')
		}
	])

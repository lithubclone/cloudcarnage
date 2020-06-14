extends Control

onready var sound = $AudioSelection
var scene

func _on_NewGameButton_pressed():
	sound.play()
	scene = "res://Scenes/Arena.tscn"

func _on_ContinueButton_pressed():
	sound.play()
	scene = "res://Scenes/TestGround.tscn"

func _on_OptionsButton_pressed():
	sound.play()
	scene = "res://Scenes/Game/Options.tscn"


func _on_AudioSelection_finished():
	get_tree().change_scene(scene)

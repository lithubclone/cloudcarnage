extends Control

func _on_NewGameButton_pressed():
	get_tree().change_scene("res://Scenes/Arena.tscn")

func _on_ContinueButton_pressed():
	get_tree().change_scene("res://Scenes/Game/Continue.tscn")

func _on_OptionsButton_pressed():
	get_tree().change_scene("res://Scenes/Game/Options.tscn")

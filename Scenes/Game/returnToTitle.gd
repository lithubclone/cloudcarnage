extends Control

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Title.tscn")


func _on_Test_pressed():
	get_tree().change_scene("res://Scenes/TestGround.tscn")

func _on_Arena_pressed():
	get_tree().change_scene("res://Scenes/Arena.tscn")


func _on_TestingGround_pressed():
	get_tree().change_scene("res://Scenes/TestGround.tscn")

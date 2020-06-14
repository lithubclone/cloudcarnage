extends Control

onready var soundNo = $AudioNo
onready var soundYes = $AudioYes
var scene
var backButton

func _ready():
	backButton = $CenterContainer/VBoxContainer/Back
	backButton.grab_focus()

func _on_Back_pressed():
	soundNo.play()
	scene = "res://Scenes/Title.tscn"

func _on_Arena_pressed():
	soundYes.play()
	scene = "res://Scenes/Arena.tscn"

func _on_TestingGround_pressed():
	soundYes.play()
	scene = "res://Scenes/TestGround.tscn"

func _on_AudioNo_finished():
	get_tree().change_scene(scene)
	
func _on_AudioYes_finished():
	get_tree().change_scene(scene)

func _on_Fight_pressed():
	soundYes.play()
	scene = "res://Scenes/Arena.tscn"

extends Control

onready var soundNo = $AudioNo
onready var soundYes = $AudioYes
var scene
onready var option1 = $TopContainer/HBoxContainer/VBoxContainer1/OptionButton1
onready var option2 = $TopContainer/HBoxContainer/VBoxContainer2/OptionButton2
onready var option3 = $TopContainer/HBoxContainer/VBoxContainer3/OptionButton3

func _ready():
	option1.add_item("Fire", 1)
	option1.add_item("Water", 2)
	option1.add_item("Earth", 3)
	
	option2.add_item("Pistol", 1)
	option2.add_item("Colt", 2)
	option2.add_item("Airsoft", 3)
	
	option3.add_item("Magic Bullet", 1)
	option3.add_item("Rocket", 2)
	option3.add_item("Mine", 3)

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
	





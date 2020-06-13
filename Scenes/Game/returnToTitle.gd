extends Control

onready var soundNo = $AudioNo
onready var soundYes = $AudioYes
var scene

#Player1
onready var option11 = $TopContainer/HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer1/OptionButton1
onready var option12 = $TopContainer/HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer2/OptionButton2
onready var option13 = $TopContainer/HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer3/OptionButton3
#Player2
onready var option21 = $TopContainer/HBoxContainer/VBoxContainer2/HBoxContainer/VBoxContainer1/OptionButton1
onready var option22 = $TopContainer/HBoxContainer/VBoxContainer2/HBoxContainer/VBoxContainer2/OptionButton2
onready var option23 = $TopContainer/HBoxContainer/VBoxContainer2/HBoxContainer/VBoxContainer3/OptionButton3
#Items


func _ready():
	option11.add_item("Fire", 1)
	option11.add_item("Water", 2)
	option11.add_item("Earth", 3)
	
	option12.add_item("Pistol", 1)
	option12.add_item("Colt", 2)
	option12.add_item("Airsoft", 3)
	
	option13.add_item("Magic Bullet", 1)
	option13.add_item("Rocket", 2)
	option13.add_item("Mine", 3)

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
	





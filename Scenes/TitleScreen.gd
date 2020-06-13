extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
#func _ready():
#	for button in $Menu/CenterRow/Buttons.get_children():
#		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])
#
#func _on_button_pressed(scene_to_load):
#	get_tree().change_scene(scene_to_load)

func _on_NewGameButton_pressed():
	get_tree().change_scene($Menu/CenterRow/Buttons/NewGameButton.scene_to_load)

func _on_ContinueButton_pressed():
	get_tree().change_scene($Menu/CenterRow/Buttons/ContinueButton.scene_to_load)

func _on_OptionsButton_pressed():
	get_tree().change_scene($Menu/CenterRow/Buttons/OptionsButton.scene_to_load)

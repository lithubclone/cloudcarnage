extends Node2D

var userNum
var dmg = 50
var element

func getElement():
	return element

func setElement(var e):
	element = e

func setDmg(var d):
	dmg = d

func setUserNum(var n):
	userNum = n

func getUserNum():
	return userNum

func _ready():
	$Audio.play()
	pass # Replace with function body.


func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.visible = false
	if !$Audio.playing:
		queue_free()
	pass # Replace with function body.


func _on_Audio_finished():
	if $AnimatedSprite.visible == false:
		queue_free()
	pass # Replace with function body.




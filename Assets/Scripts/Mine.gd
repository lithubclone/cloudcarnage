extends Node2D

var speed = 800
var angle = 0
var timer = 10
var dmg = 10
var motion = Vector2(1,0)
var userNum

func setUserNum(var n):
	userNum = n

func getUserNum():
	return userNum

func setDirSimple(var dir):
	if dir == 1:
		speed = -abs(speed)
	else:
		speed = abs(speed)
	

func setDir(var v):
	motion = v
	pass

func setAngle(var alpha):
	angle = alpha

func dmgMod(var d):
	dmg *= d

func _ready():
	
	pass # Replace with function body.

func _physics_process(delta):
	if timer > 0:
		timer -= delta
	else:
		queue_free()
		
	translate(speed*motion*delta)
	pass

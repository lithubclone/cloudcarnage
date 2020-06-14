extends Node2D

const GRAVITY = 20
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
	motion.y += GRAVITY #Grtavity n sSIOHTiukswareh ölotis
	motion.y = min(motion.y, 800)
	
	motion.x = lerp(motion.x,0,0.01)
	
	if timer > 0:
		timer -= delta
		speed -= 10*delta
	else:
		queue_free()
		
	translate(speed*motion*delta)
	pass

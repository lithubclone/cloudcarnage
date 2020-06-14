extends KinematicBody2D

const EXPLOSION = preload("res://Assets/Objects/Explosion.tscn")

const GRAVITY = 20
var speed = 300
var angle = 0
var timer = 5
var dmg = 60
var motion = Vector2(1,0)
var userNum
var element


func setUserNum(var n):
	userNum = n

func getUserNum():
	return userNum

func setDirSimple(var dir):
	if dir == 1:
		speed = -abs(speed)
		motion.x = speed
	else:
		speed = abs(speed)
		motion.x = speed

func getElement():
	return element

func setElement(var e):
	element = e

func setDir(var v):
	motion = v
	pass

func setAngle(var alpha):
	angle = alpha

func dmgMod(var d):
	dmg *= d

func explode():
	var explosion = EXPLOSION.instance()
	get_parent().add_child(explosion)
	explosion.position = position
	explosion.setDmg(dmg)
	explosion.setUserNum(userNum)
	explosion.setElement(element)
	queue_free()

func _ready():
	
	pass # Replace with function body.

func _physics_process(delta):
	
	motion.y += GRAVITY #Grtavity n sSIOHTiukswareh ölotis
	motion.y = min(motion.y, 800)
	
	if timer > 0:
		timer -= delta
	else:
		explode()
	
	if is_on_floor():
		motion.x = lerp(motion.x,0,0.1)
	else:
		motion.x = lerp(motion.x,0,0.001)
	
	move_and_slide(motion, Vector2(0,-1))
	pass


func _on_Area2D_area_entered(area):
	if area.get_collision_layer_bit(1) and area.get_parent().playerNum != userNum:
		print("Hello")
		explode()
		pass
		
	pass # Replace with function body.

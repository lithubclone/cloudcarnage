extends KinematicBody2D

const UP = Vector2(0,-1);
const SPEED = 400;
const ACCELERATION = 210;
const JUMPFORCE = -600;
const GRAVITY = 27;

var motion = Vector2();
var friction = false;
#steptimer?
var flip = false;  ###maybe for weapons? extra object?
var jumpforce = 0; #variable. jumpforce should dynamically decrease by GRAVITY
#var dead = false;

func _ready():
	#iNiTiAlIsIeRe deinen Shit hier!!
	pass

func move():
	
	#sprite speed scale
	$AnimatedSprite.speed_scale = 1
	
	if Input.is_action_pressed("ui_right"):
		flip = true
		motion.x = min(motion.x+ACCELERATION, SPEED)#*Input.get_action_strength("ui_right")
		if is_on_floor():
			$AnimatedSprite.play("idle")#walk
			$AnimatedSprite.speed_scale = Input.get_action_strength("ui_right")
		$AnimatedSprite.flip_h = 1
	elif Input.is_action_pressed("ui_left"):
		flip = false
		motion.x = max(motion.x-ACCELERATION, -SPEED)#*Input.get_action_strength("ui_left")
		if is_on_floor():
			$AnimatedSprite.play("idle")#walk
			$AnimatedSprite.speed_scale = Input.get_action_strength("ui_left")
		$AnimatedSprite.flip_h = 0
	else:
		friction = true
	pass
	
func _physics_process(delta):
	
	motion.y += GRAVITY
	motion.y = min(motion.y, 600)	
	
	move()
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			motion.y = JUMPFORCE
		if friction == true:
			motion.x = lerp(motion.x,0,0.3)
	else:
		if friction == true:
			motion.x = lerp(motion.x,0,0.05)
		if motion.y < 0:
			$AnimatedSprite.play("idle")
			 #BUG: Animation not playing, just still image
		if motion.y > 0:
			$AnimatedSprite.play("idle")
	
	friction = false
	
	motion = move_and_slide(motion, UP)
	
	pass

extends KinematicBody2D

const UP = Vector2(0,-1); #this is up, duh
const SPEED = 400; #maximum movement speed
const ACCELERATION = 110; #maximum acceleration
const JUMPFORCE = -550; #maximum jump force. negative because up is negative
const GRAVITY = 27; #personalized player gravity. N SHIT

var motion = Vector2(); #motion vector which determines player move direction. used in func "move_in_slide()"
var friction = false; #friction
#steptimer?
var flip = false;  ###maybe for weapons? extra object?
var jumpforce = 0; #variable. jumpforce should be dynamically decreased by GRAVITY
#var dead = false;

func _ready():
	#iNiTiAlIsIeRe deinen Shit hier!!
	pass

func move():
	
	#sprite speed scale
	$AnimatedSprite.speed_scale = 1   #using input strength animation speed can be regulated. see note 1
	
	if Input.is_action_pressed("ui_right"):
		flip = true
		$GunPosition.position.x *= -1
		motion.x = min(motion.x+ACCELERATION, SPEED)#*Input.get_action_strength("ui_right") #note 1
		if is_on_floor():
			$AnimatedSprite.play("run")#walk
			$AnimatedSprite.speed_scale = Input.get_action_strength("ui_right")
		$AnimatedSprite.flip_h = 1
	elif Input.is_action_pressed("ui_left"):
		flip = false
		$GunPosition.position.x *= -1
		motion.x = max(motion.x-ACCELERATION, -SPEED)#*Input.get_action_strength("ui_left") # note 1
		if is_on_floor():
			$AnimatedSprite.play("run")#walk
			$AnimatedSprite.speed_scale = Input.get_action_strength("ui_left")
		$AnimatedSprite.flip_h = 0
	else:
		friction = true
		$AnimatedSprite.play("idle")
	pass
	
func _physics_process(delta):
	
	motion.y += GRAVITY #Grtavity n sSIOHTiukswareh ölotis
	motion.y = min(motion.y, 800)	
	
	
	
	move()
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			jumpforce = -40
			motion.y = JUMPFORCE
		if friction == true:
			motion.x = lerp(motion.x,0,0.3)
	else:
		if Input.is_action_pressed("ui_accept"):
			motion.y += jumpforce
		jumpforce = lerp(jumpforce, 0, 0.1)
		if friction == true:
			motion.x = lerp(motion.x,0,0.1)
		if motion.y < 0:
			$AnimatedSprite.play("jumpUp")
			
		if motion.y > 0:
			$AnimatedSprite.play("jumpDown")
	
	
	if is_on_wall() and !is_on_floor():  #wall jump stuff. maybe climbing stuff as well. code not stuff. sorry
		motion.y = 100
		$AnimatedSprite.play("wall")
		if flip == true:
			if Input.is_action_just_pressed("ui_accept") and Input.is_action_pressed("ui_right"):
				motion.y = JUMPFORCE*1.5
				motion.x = -SPEED*1.8
		else:
			if Input.is_action_just_pressed("ui_accept") and Input.is_action_pressed("ui_left"):
				motion.y = JUMPFORCE*1.5
				motion.x = SPEED*1.8
	
	if is_on_ceiling():
		motion.y += -JUMPFORCE/3
	
	
	friction = false  #FRICTION! Lets Grind baby
	

	
	motion = move_and_slide(motion, UP) # move and slide BITCH
	
	pass

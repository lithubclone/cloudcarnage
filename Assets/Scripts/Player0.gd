extends KinematicBody2D

const UP = Vector2(0,-1);
const SPEED = 80;
const ACCELERATION = 60;
const JUMPFORCE = 50;
const GRAVITY = 20;

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
	
	if Input.is_action_pressed("ui_right"):
		flip = true
		motion.x = min(motion.x+ACCELERATION, SPEED)*Input.get_action_strength("ui_right")
		if is_on_floor():
			$AnimatedSprite.play("idle")#walk
			$AnimatedSprite.speed_scale = Input.get_action_strength("ui_right")
		$AnimatedSprite.flip_h = 0
	elif Input.is_action_pressed("ui_left"):
		flip = true
	pass

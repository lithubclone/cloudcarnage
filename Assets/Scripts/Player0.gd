extends KinematicBody2D

const UP = Vector2(0,-1); #this is up, duh
const SPEED = 400; #maximum movement speed
const ACCELERATION = 110; #maximum acceleration
const JUMPFORCE = -550; #maximum jump force. negative because up is negative
const GRAVITY = 27; #personalized player gravity. N SHIT

var WEAPON #pseudo-constante  WORKAROUND FFFFUCKERS
var weapon
var motion = Vector2(); #motion vector which determines player move direction. used in func "move_in_slide()"
var friction = false; #friction
#steptimer?
var flip = false;  ###maybe for weapons? extra object?
var jumpforce = 0; #variable. jumpforce should be dynamically decreased by GRAVITY
#var dead = false;
const steps = [preload("res://Assets/Audio/movement/step5.wav"),preload("res://Assets/Audio/movement/step1.wav"),preload("res://Assets/Audio/movement/step2.wav"),preload("res://Assets/Audio/movement/step3.wav")]

var hp = 100
var killerNum
var spawnPoints
export var playerNum = 0
var input
var sprites
var element
var dead = false

func _ready():
	
	print(str(playerNum)+" hat Element "+str(element))
	#iNiTiAlIsIeRe deinen Shit hier!!
	
	if playerNum == 0:
		input = global.input0
		sprites = global.sprites0
		WEAPON = global.weapon0;
		element = global.element0
	elif playerNum == 1:
		input = global.input1
		sprites = global.sprites1
		WEAPON = global.weapon1;
		element = global.element1
	
	print(str(playerNum)+" hat Element "+str(element))
	
	#add_child(element)
	weapon = WEAPON.instance()
	$GunPosition.add_child(weapon)
	#weapon.position = $GunPosition.position
	spawnPoints = [get_parent().get_node("Spawn0"),get_parent().get_node("Spawn1"),get_parent().get_node("Spawn2"),get_parent().get_node("Spawn3")]
	
	pass

func getElement():
	return element

func setElement(var e):
	element = e

func getPlayerNum():
	return playerNum

func death():
	$AnimatedSprite.speed_scale = 1
	$AudioDeath.play()
	dead = true
	
	$Hitbox.monitoring = false
	
	hp = 100
	
	global.score[killerNum] += 1
	
	global.testWin()
	
	$AnimatedSprite.play(sprites[5])

func spawn():
	$Hitbox.monitoring = true
	$AudioSpawn.play()
	$AnimatedSprite.play(sprites[6])
	var spawnNum = randi()%4
	position = spawnPoints[spawnNum].position	

func calcMultiplier(var e):
	if element == "flame":
		print("got here")
		match e:
			"flame":
				return 1
			"water":
				return 1.5
			"earth":
				return 0.5
			global.WIND:
				return 1
	elif element == "water":
		match e:
			"flame":
				return 0.5
			"water":
				return 1
			"earth":
				return 1.5
			global.WIND:
				return 1
	elif element == "earth":
		match e:
			"flame":
				return 1.5
			"water":
				return 0.5
			"earth":
				return 1
			global.WIND:
				return 1
	elif element == "wind":
		match e:
			"flame":
				return 1
			"water":
				return 1
			global.EARTH:
				return 1
			global.WIND:
				return 1
	else:
		print("Element was"+str(element))
		return 0

func move():
	
	#sprite speed scale
	$AnimatedSprite.speed_scale = 1   #using input strength animation speed can be regulated. see note 1
	
	if Input.is_action_pressed(input[1]):
		flip = true
		if sign($GunPosition.position.x) == -1:
			$GunPosition.position.x *= -1;
			
		motion.x = min(motion.x+ACCELERATION, SPEED)*Input.get_action_strength(input[1]) #note 1
		if is_on_floor():
			$AnimatedSprite.play(sprites[1])#walk
			$AnimatedSprite.speed_scale = Input.get_action_strength(input[1])
		$AnimatedSprite.flip_h = 1
	elif Input.is_action_pressed(input[2]):
		flip = false
		if sign($GunPosition.position.x) == +1:
			$GunPosition.position.x *= -1;
			
		motion.x = max(motion.x-ACCELERATION, -SPEED)*Input.get_action_strength(input[2]) # note 1
		if is_on_floor():
			$AnimatedSprite.play(sprites[1])#walk
			$AnimatedSprite.speed_scale = Input.get_action_strength(input[2])
		$AnimatedSprite.flip_h = 0
	else:
		friction = true
		$AnimatedSprite.play(sprites[0])
	pass
	
func inAir():
	if is_on_floor():
		if (Input.is_action_pressed(input[1]) or Input.is_action_pressed(input[2])):
			if !$AudioStep.playing:
				$AudioStep.stream = steps[randi()%4]
				$AudioStep.play()
		
		if Input.is_action_just_pressed(input[3]):
			$AudioJump.play()
			jumpforce = -40
			motion.y = JUMPFORCE
		if friction == true:
			motion.x = lerp(motion.x,0,0.3)
	else:
		$AudioStep.stop()
		if Input.is_action_pressed(input[3]):
			motion.y += jumpforce
		jumpforce = lerp(jumpforce, 0, 0.1)
		if friction == true:
			motion.x = lerp(motion.x,0,0.1)
		if motion.y < 0:
			$AnimatedSprite.play(sprites[2])
			
		if motion.y > 0:
			$AnimatedSprite.play(sprites[3])
	
	
	if is_on_wall() and !is_on_floor(): #and !Input.is_action_pressed("ui_accept"):  #wall jump stuff. maybe climbing stuff as well. code not stuff. sorry
		motion.y = 100
		if !$AudioWallslide.playing:
			$AudioWallslide.play()
		$AnimatedSprite.play(sprites[4])
		weapon.enable(false)
		if flip == true:
			if Input.is_action_just_pressed(input[3]) and Input.is_action_pressed(input[1]):
				motion.y = JUMPFORCE*1.5
				motion.x = -SPEED*1.8
		else:
			if Input.is_action_just_pressed(input[3]) and Input.is_action_pressed(input[2]):
				motion.y = JUMPFORCE*1.5
				motion.x = SPEED*1.8
	else: 
		weapon.enable(true)
		$AudioWallslide.stop()
	
	if is_on_ceiling():
		motion.y += -JUMPFORCE/3


func _physics_process(delta):
	
	motion.y += GRAVITY #Grtavity n sSIOHTiukswareh ölotis
	motion.y = min(motion.y, 800)
	
	if hp <= 0:
		death()
	
	
	if !dead:
		move()
		inAir()
	else:
		motion.x = 0
	
	
	
	friction = false  #FRICTION! Lets Grind baby
	
	
	motion = move_and_slide(motion, UP) # move and slide BITCH
	
	pass


func _on_Hitbox_area_entered(area):
	if area.get_collision_layer_bit(2):
		if area.get_parent().getUserNum() != playerNum:
			killerNum = area.get_parent().getUserNum()
			var m =  calcMultiplier(area.get_parent().getElement())
			hp -= (area.get_parent().dmg * m)
			print("Pl0 Hit!"+" HP: "+str(hp))
			if "Explosion" in area.get_parent().name:
				area.queue_free()
			else:
				area.get_parent().queue_free()
	pass # Replace with function body.


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == sprites[5]:
		spawn()
		pass
	elif $AnimatedSprite.animation == sprites[6]:
		dead = false
	pass # Replace with function body.

extends Node2D

const PROJECTILE = preload("res://Assets/Objects/Projectiles/MagicBullet.tscn")

const COOLDOWN = 0.6;
var reload = 0;

var input = ["shoot0", "right0", "left0"]
#var input = ["shoot0", "right0", "left0"]
var playerNum = 0


func _ready():
	playerNum = get_parent().get_parent().getPlayerNum()
	if playerNum == 0:
		input = ["shoot0", "right0", "left0"]
	elif playerNum == 1:
		input = ["shoot1", "right1", "left1"]
	pass # Replace with function body.

func enable(var v):
	if v:
		visible = true
	else:
		visible = false

func _physics_process(delta):
	if reload > 0:
		reload -= 1*delta;
	
	$Sprite.flip_h = get_parent().get_parent().flip
	
	if (abs(Input.get_joy_axis(playerNum,JOY_AXIS_2)) > 0.5 or abs(Input.get_joy_axis(playerNum,JOY_AXIS_3)) > 0.5)  && reload <= 0:
		#get_parent().get_parent().get_parent().get_node("ScreenShake").shake(7,0.5)
		reload = COOLDOWN;
		$Audio.play()
		var projectile = PROJECTILE.instance();
		get_parent().get_parent().get_parent().add_child(projectile)
		projectile.position = $Position2D.global_position;
		#if $Sprite.flip_h == true:
			#projectile.set_dir(-1)
		projectile.setDir(Vector2(Input.get_joy_axis(playerNum, JOY_AXIS_2),Input.get_joy_axis(playerNum, JOY_AXIS_3)).normalized())
	elif (Input.is_action_pressed(input[0]) && reload <= 0):
		reload = COOLDOWN;
		$Audio.play()
		var projectile = PROJECTILE.instance();
		get_parent().get_parent().get_parent().add_child(projectile)
		projectile.position = $Position2D.global_position;
		if $Sprite.flip_h == true:
			projectile.setDirSimple(-1)
		else:
			projectile.setDirSimple(1)

	
	if Input.is_action_pressed(input[1]):
		if sign($Position2D.position.x) == -1:
			$Position2D.position.x *= -1;
	if Input.is_action_pressed(input[2]):
		if sign($Position2D.position.x) == 1:
			$Position2D.position.x *= -1;
	
	pass
extends Node2D

#const PROJECTILE = preload("")

const COOLDOWN = 0.6;
var reload = 0;


func _ready():
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
	
	if Input.is_action_pressed("ui_accept") && reload <= 0:
		#get_parent().get_parent().get_parent().get_node("ScreenShake").shake(7,0.5)
		reload = COOLDOWN;
		$Audio.play()
		#var projectile = PROJECTILE.instance();
		#get_parent().get_parent().get_parent().add_child(shot)
		#shot.position = $Position2D.global_position;
		#if $Sprite.flip_h == true:
	#		shot.set_dir(-1)
	
	if Input.is_action_pressed("ui_right"):
		if sign($Position2D.position.x) == -1:
			$Position2D.position.x *= -1;
	if Input.is_action_pressed("ui_left"):
		if sign($Position2D.position.x) == 1:
			$Position2D.position.x *= -1;
	
	pass
extends CanvasLayer

#var win = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timer = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	$Scorebox_P1/P1_Score.text = "Blue: " + str(global.score[0])
	$Scorebox_P2/P2_Score.text = "Red: " + str(global.score[1])
	#$Scorebox_P3/P3_Score.text = "Purple: " + str(global.score[2])
	#$Scorebox_P4/P4_Score.text = "Pink: " + str(global.score[3])
	
	
	#if(global.win):
	if(global.win):
		if timer > 0:
			timer -= delta
		else:
			global.score = [0,0,0,0]
			global.win = false
			get_tree().change_scene("res://Scenes/Game/Options.tscn")
		winscreen()
	else:
		$Winbox.visible = false
		$Winbox/Winner/P0.visible = false
		$Winbox/Winner/P1.visible = false

func winscreen():
	$Winbox.visible = true
	#$Winbox.modulate()
	if(global.winner==0):
		$Winbox/Winner/P0.visible = true
		$Winbox/Win_Message_Box/Win_Message.text = "Blue won the Game!"
	elif(global.winner==1):
		$Winbox/Winner/P1.visible = true
		$Winbox/Win_Message_Box/Win_Message.text = "Red won the Game!"
	else:
		$Winbox/Win_Message_Box/Win_Message.text = "This Text shouldn't be here!"

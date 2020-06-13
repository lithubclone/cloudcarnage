extends CanvasLayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	$MarginContainer/VSplitContainer/HSplitContainer/Label0.text = "Blue: "+str(global.score[0])
	$MarginContainer/VSplitContainer/HSplitContainer/Label1.text = "Red: "+str(global.score[1])
	$MarginContainer/VSplitContainer/HSplitContainer2/Label2.text = "Yellow: "+str(global.score[2])
	$MarginContainer/VSplitContainer/HSplitContainer2/Label3.text = "Green: "+str(global.score[3])
	pass
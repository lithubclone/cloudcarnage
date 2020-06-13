extends CanvasLayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	$MarginContainer/HSplitContainer/Label0.text = "Blue: "+str(global.score0)
	$MarginContainer/HSplitContainer/Label1.text = "Red: "+str(global.score1)
	pass
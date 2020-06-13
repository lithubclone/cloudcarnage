extends CenterContainer

#Player3
onready var option11 = $HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer1/weapon1
onready var option12 = $HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer2/magic1
onready var option13 = $HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer3/projectile1
#Player4
onready var option21 = $HBoxContainer/VBoxContainer2/HBoxContainer/VBoxContainer1/weapon2
onready var option22 = $HBoxContainer/VBoxContainer2/HBoxContainer/VBoxContainer2/magic2
onready var option23 = $HBoxContainer/VBoxContainer2/HBoxContainer/VBoxContainer3/projectile2
#Items (magic, weapon, projectile)
var m = ["Fire", "Water", "Earth"]
var w = ["Pistol", "Colt", "Airsoft"]
var p = ["MagicBullet", "Rocket", "Mine"]

func _ready():
	for i in range(m.size()):
		option11.add_item(m[i])
		option21.add_item(m[i])
	for i in range(w.size()):
		option12.add_item(w[i])
		option22.add_item(w[i])
	for i in range(p.size()):
		option13.add_item(p[i])
		option23.add_item(p[i])

func _on_weapon1_item_selected(ID):
	global.weapon2 = option11


func _on_magic1_item_selected(ID):
	global.element2 = option12


func _on_projectile1_item_selected(ID):
	global.projectile2 = option13


func _on_weapon2_item_selected(ID):
	global.weapon3 = option21


func _on_magic2_item_selected(ID):
	global.element3 = option22


func _on_projectile2_item_selected(ID):
	global.projectile3 = option23

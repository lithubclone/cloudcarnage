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
var m = ["Flame", "Water", "Earth"]
var w = ["Pistol", "Crossbow", "MG"]
var p = ["MagicBullet", "Mine"]

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
	match option11:
		"Pistol":
			global.weapon2 = global.PISTOL
		"Crossbow":
			global.weapon2 = global.CROSSBOW
		"MG":
			global.weapon2 = global.MG

func _on_magic1_item_selected(ID):
	match option12:
		"Flame":
			global.element2 = global.FLAME
		"Water":
			global.element2 = global.WATER
		"Earth":
			global.element2 = global.EARTH
			
func _on_projectile1_item_selected(ID):
	match option13:
		"MagicBullet":
			global.element2 = global.FLAME
		"Mine":
			global.element2 = global.WATER


func _on_weapon2_item_selected(ID):
	match option21:
		"Pistol":
			global.weapon3 = global.PISTOL
		"Crossbow":
			global.weapon3 = global.CROSSBOW
		"MG":
			global.weapon3


func _on_magic2_item_selected(ID):
	match option22:
		"Flame":
			global.element3 = global.FLAME
		"Water":
			global.element3 = global.WATER
		"Earth":
			global.element3 = global.EARTH


func _on_projectile2_item_selected(ID):
	match option23:
		"MagicBullet":
			global.element3 = global.FLAME
		"Mine":
			global.element3 = global.WATER

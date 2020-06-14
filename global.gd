extends Node

#weapons
const PISTOL = preload("res://Assets/Objects/Pistol.tscn")
const MG = preload("res://Assets/Objects/MG.tscn")
const CROSSBOW = preload("res://Assets/Objects/Crossbow.tscn")

#Projectiles
const MAGICBULLET = preload("res://Assets/Objects/Projectiles/MagicBullet.tscn")
const MINE = preload("res://Assets/Objects/Projectiles/Mine.tscn")

#Player 0
var weapon0 = PISTOL
var projectile0 = MINE
var element0
var input0 = ["shoot0","right0","left0","jump0"]
var sprites0 =["idle0","run0","jumpUp0","jumpDown0","wall0"]

#Player 1
var weapon1 = PISTOL
var projectile1 = MAGICBULLET
var element1
var input1 = ["shoot1","right1","left1","jump1"]
var sprites1 =["idle1","run1","jumpUp1","jumpDown1","wall1"]

#Player 2
var weapon2
var projectile2
var element2

#Player 3
var weapon3
var projectile3
var element3

var score = [0,0,0,0]

func _ready():
	pass # Replace with function body.


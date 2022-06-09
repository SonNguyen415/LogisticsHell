extends Node2D


var player
var enemy 


var node = preload("res://Units/ArmyUnit.tscn")

func spawning():
	enemy = node.instance()
	enemy.global_position = Vector2(800, 200)
	enemy._init("Enemy")
	add_child(enemy) #Spawns wherever script is attatched.
	
	enemy = node.instance()
	enemy.global_position = Vector2(400, 400)
	enemy._init("Enemy")
	add_child(enemy) #Spawns wherever script is attatched.

# Called when the node enters the scene tree for the first time.
func _ready():
	spawning()


func _input(event):
	if event is InputEventMouseButton and event.pressed and event.doubleclick and event.button_index==1:
		player = node.instance()
		player.global_position = get_viewport().get_mouse_position()
		player._init("Player")
		add_child(player)



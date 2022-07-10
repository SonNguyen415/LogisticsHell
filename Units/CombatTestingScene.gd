extends Node2D


var node = preload("res://Units/ArmyUnit.tscn")
var batnode = preload("res://Units/BattalionUnit.tscn")

func spawning(type, unit, posX, posY):
	var army = node.instance()
	var battalion = batnode.instance()
	army.global_position = Vector2(posX, posY)
	battalion._init(unit)
	add_child(battalion)
	army._init(type, [battalion])
	add_child(army) #Spawns wherever script is attatched.

# Called when the node enters the scene tree for the first time.
func _ready():
	spawning("Enemy", "Infantry", 400, 400)
	spawning("Enemy", "Infantry", 800, 200)


func _input(event):
	if event is InputEventMouseButton and event.pressed and event.doubleclick and event.button_index==1:
		spawning("Player", "Infantry", get_viewport().get_mouse_position().x, get_viewport().get_mouse_position().y)



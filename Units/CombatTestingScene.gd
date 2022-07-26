extends Node2D


var node = preload("res://Units/ArmyUnit.tscn")
var batnode = preload("res://Units/BattalionUnit.tscn")

func spawning(type, unit, posX, posY):
	var army = node.instance()
	army.global_position = Vector2(posX, posY)
	var battalion = []
	for x in range(3):
		battalion.append(batnode.instance())
		battalion[x]._init(unit)
	for x in range (3):
		add_child(battalion[x])
	
	army._init(1, type, battalion)
	add_child(army)
	return army

# Called when the node enters the scene tree for the first time.
func _ready():
	var enemy1 = spawning("Enemy", "Infantry", 400, 400)
	var enemy2 = spawning("Enemy", "Infantry", 800, 200)


func _input(event):
	if event is InputEventMouseButton and event.pressed and event.doubleclick and event.button_index==1:
		spawning("Player", "Infantry", get_viewport().get_mouse_position().x, get_viewport().get_mouse_position().y)



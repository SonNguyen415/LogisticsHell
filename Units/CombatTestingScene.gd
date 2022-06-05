extends Node2D


var player
var enemy = Army.new("Enemy", 400, 400)


var node = preload("res://Units/ArmyUnit.tscn")

func spawning():
	player = node.instance()
	player.global_position = Vector2(800, 200)
	add_child(player) #Spawns wherever script is attatched.

# Called when the node enters the scene tree for the first time.
func _ready():
	spawning()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

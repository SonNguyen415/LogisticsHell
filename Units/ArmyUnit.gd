extends KinematicBody2D


# Variables
var movement_speed = 10
var movement_reduction = 0
var postionX = 0
var positionY = 0


var selected = false
onready var army_value_display = $Control/ArmyCount

func set_size(size):
	army_value_display.text = size

func _ready():
	set_size(str(70)) # Debug Test



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

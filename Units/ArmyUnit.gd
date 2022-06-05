"""
---------------------------------------------------------------------------------------------------

[Insert file description]

Authors: Warren Nguyen

---------------------------------------------------------------------------------------------------
"""


extends KinematicBody2D

# Constants
const BASE_MAINTENANCE = 10
const BASE_SPEED = 10
const BASE_REDUCTION = 10


# Variables
var movement_speed = BASE_SPEED
var movement_reduction = BASE_REDUCTION

var maintenance_cost = BASE_MAINTENANCE

onready var army_value_display = $Control/ArmyCount


func _process(delta):
	pass

func set_size(size):
	army_value_display = str(size)

func _ready():
	set_size(str(70)) # Debug Test



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


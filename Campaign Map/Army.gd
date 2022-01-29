extends Node2D

# Do Stuff Later
# For now it's just blitting and stuff

onready var army_value_display = $Control/ArmyCount

func set_size(size):
	army_value_display.text = size

func _ready():
	set_size(str(70)) # Debug Test

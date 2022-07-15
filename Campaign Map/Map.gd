extends Node


var tile_list = []







# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func build_depot(tile):
	tile_list[tile].movement_modifier += 1.0
	tile_list[tile].carrying_capacity += 1.0

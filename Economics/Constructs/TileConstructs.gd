"""
---------------------------------------------------------------------------------------------------

This file serves as a parent class for the various tile constructions

Authors: Son Nguyen

---------------------------------------------------------------------------------------------------
"""


extends Node
class_name TileConstructs



# Some constants, will be moved out:
var BASE_DEPOT_COST = 10
var BASE_DEPOT_TIME = 24



var construct_name
var build_cost
var build_time
var storage_capacity
var buildings 
var modifier

func _init(call_name):
	construct_name = call_name
	if call_name == 'Depot':
		set_build_cost(BASE_DEPOT_COST)
	
	
func get_construct_modifier():
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

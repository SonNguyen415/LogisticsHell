"""
---------------------------------------------------------------------------------------------------

This file serves as a parent class for the various tile constructions

Authors: Son Nguyen

---------------------------------------------------------------------------------------------------
"""


extends Node
class_name TileConstructs



# Some constants, will be moved out:


var BASE_DEPOT_COST = {'Wood': 10 }
var BASE_DEPOT_TIME = 24

var BASE_FORT_COST = {'Stone': 2, 'Wood': 10}
var BASE_FORT_TIME = 24*2



# Static attribute
const count = {'depot': 0, 'fort': 0}

# Class attributes
var construct_name
var build_cost
var build_time
var storage_capacity
var buildings 
var modifier
var location


func _init(call_name):
	construct_name = call_name
	count[construct_name] += 1
	build_construct()


func build_construct():
	# subtract resource from local army
	# location = ArmyUnit.get_army_location()
	pass
		
		
func store_resources(id):
	# Remove resource from local army
	pass
		
		
func set_construct_buildings():
	if construct_name == 'Depot':
		buildings = {'warehouses': 3}
	elif construct_name == 'Fort':
		buildings = {'warehouses': 2, 'wall': 1}
		
	var storage_capacity = buildings['warehouses']*Defines.WAREHOUSE_SPACE
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

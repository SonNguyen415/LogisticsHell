"""
---------------------------------------------------------------------------------------------------

Settlement Resource Code
Stores information about settlement resource count and can be added/subtracted

Authors: Max Kim, Son Nguyen

---------------------------------------------------------------------------------------------------
"""

extends Node2D
class_name SettlementResource

export (Script) var resources = preload("res://Economics/Resources/ResourceList.gd")

var tax_base = 10
var storage_dictionary = {}

func _ready():
	var material_list = resources.raw_material_dictionary + resources.manufactured_material_dictionary
	# Once saving is implemented, load data here
	# Otherwise, well.
		

# TODO: Fix below

func add_resource(resource, count, maximum):
	# Resource: String name of resource to add
	# Count: Amount to add
	# Maximum: maximum capacity
	storage_dictionary[resource] = clamp(storage_dictionary[resource]  + count, 0, maximum)

func subtract_resource(resource, count):
	# Resource: String name of resource to add
	# Returns true if successful, and false if unable to (not enough vespene gas)
	if storage_dictionary[resource] < count:
		return false
	storage_dictionary[resource] -= count

func get_resource_count(resource):
	return storage_dictionary[resource]

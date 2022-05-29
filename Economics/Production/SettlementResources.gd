"""
---------------------------------------------------------------------------------------------------

Settlement Resource Code
Stores information about settlement resource count and can be added/subtracted

Authors: Son Nguyen, Max Kim

---------------------------------------------------------------------------------------------------
"""

extends Node2D
class_name SettlementResource

export (Script) var resources = preload("res://Economics/Resources/ResourceList.gd")

var tax_base = 10
var storage_dictionary = {}

func _ready():
	var material_list = resources.material_list
	for producable_material in material_list: # Material is a reserved keyword sadly
		storage_dictionary[producable_material] = 0

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

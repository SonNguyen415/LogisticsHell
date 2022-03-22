extends Node
class_name SettlementResource

var storage_dictionary = {"food" : 0, "wood" : 0, "copper" : 0, "cloth" : 0, "iron" : 0,
						 "steel" : 0, "glasses": 0, "gunpowder" : 0, "preservatives" : 0, "smokeless_powder" : 0,
						"horses" : 0, "coal" : 0, "oil" : 0, "electricity" : 0, "uranium" : 0}
var resource_count = 15 # Total number of unique resources
# We can add more later I guess

func add_resource(resource, count):
	# Resource: String name of resource to add
	# Count: Amount to add
	storage_dictionary[resource] += count

func subtract_resource(resource, count):
	# Resource: String name of resource to add
	# Returns true if successful, and false if unable to (not enough vespene gas)
	if storage_dictionary[resource] < count:
		return false
	storage_dictionary[resource] -= count

func get_resource_count(resource):
	return storage_dictionary[resource]

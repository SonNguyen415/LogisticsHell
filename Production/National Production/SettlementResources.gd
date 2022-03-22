extends Node
class_name SettlementResource

# Storage Count
var food
var wood
var copper
var cloth
var iron
var steel
var glasses
var gunpowder
var preservatives
var smokeless_powder
var horses
var coal
var oil
var electricity
var uranium

var storage = [0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0]

var storage_dictionary = ["food", "wood", "copper", "cloth", "iron",
						 "steel", "glasses", "gunpowder", "preservatives", "smokeless_powder",
						"horses", "coal", "oil", "electricity", "uranium"]
var resource_count = 15 # Total number of unique resources
# We can add more later I guess

func add_resource(resource, count):
	# Resource: String name of resource to add
	# Count: Amount to add
	for i in resource_count:
		if resource == storage_dictionary[i]:
			storage[i] += count
			break

func subtract_resource(resource, count):
	# Resource: String name of resource to add
	# Returns true if successful, and false if unable to (not enough vespene gas)
	for i in resource_count:
		if resource == storage_dictionary[i]:
			if storage[i] < count:
				return false
			storage[i] -= count
			return true

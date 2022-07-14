extends Node
class_name Resources

"""
General Resource Code
-Max
"""

var value = 0 # Amount Owned
var produce = 0 # Amount Produced (Per Month)
var resource_name

func _init(call_name):
	resource_name = call_name

func set_value(val):
	# Start of mission initialization
	value = val
	
func get_value():
	# Returns value
	# Hopefully useful in UI
	return value
	
func add_value(val):
	# Adds val to resource count
	# Can be useful to simulate events
	value += val
	
func produce():
	# Called to produce one month's worth of goodies
	value += produce

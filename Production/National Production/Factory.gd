
"""
---------------------------------------------------------------------------------------------------

Class file for factories

Authors: Son Nguyen, Max Kim

---------------------------------------------------------------------------------------------------
"""


extends Node
class_name Factory

var type 
var production_rate

func set_type(toast):
	# Sets the production type of the factory to the input variable
	type = toast

func set_rate(rate):
	# Self Explanatory
	production_rate = rate

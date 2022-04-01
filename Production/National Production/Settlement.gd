"""
---------------------------------------------------------------------------------------------------

Settlement Code
Stores a script that represents the settlement's resources and building information

Authors: Son Nguyen, Max Kim

---------------------------------------------------------------------------------------------------
"""


extends Node
class_name Settlement

export (Script) var resource_script
export (Script) var building_script

var resource 
var buildings

func _ready():
	if resource_script is SettlementResource:
		resource = resource_script.instance()
	if building_script is SettlementBuildings:
		buildings = building_script.instance()
		
func load_resource_script(script):
	if script is SettlementResource:
		resource = script.instance()

func load_building_script(script):
	if script is SettlementBuildings:
		buildings = script.instance()


var production_rate = {"food" : 0, "wood" : 0, "copper" : 0, "cloth" : 0, "iron" : 0,
						 "steel" : 0, "glasses": 0, "gunpowder" : 0, "preservatives" : 0, "smokeless_powder" : 0,
						"horses" : 0, "coal" : 0, "oil" : 0, "electricity" : 0, "uranium" : 0}

func on_tick():
	for index in production_rate:
		print(index, production_rate[index])

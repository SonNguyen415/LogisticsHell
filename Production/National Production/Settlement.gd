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
		resource = resource_script.instance()
		
func load_resource_script(script):
	if script is SettlementResource:
		resource = script.instance()
func load_building_script(script):
	if script is SettlementBuildings:
		buildings = script.instance()


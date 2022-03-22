extends Node
class_name Settlement

export (Script) var resource_script

var resource 

func _ready():
	if resource_script is SettlementResource:
		resource = resource_script.instance()

func load_resource_script(script):
	if script is SettlementResource:
		resource = script.instance()

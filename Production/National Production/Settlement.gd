extends Node
class_name Settlement

export (Script) var resource_script
export (Script) var building_script

var resource 
var buildings


func _ready():
	if not resource_script == null:
		resource = resource_script.instance()

func load_resource_script(script):
	resource = script.instance()



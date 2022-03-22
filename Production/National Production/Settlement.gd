extends Node
class_name Settlement

export (Script) var resource_script

var resource 

func _ready():
	if not resource_script == null:
		resource = resource_script.instance()

func load_resource_script(script):
	resource = script.instance()

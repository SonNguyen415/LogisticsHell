extends Node


class_name SettlementBuildings


const WAREHOUSE_SPACE = 1000
const WAREHOUSE_COST = 10


var warehouses
var max_capacity = warehouses*WAREHOUSE_SPACE
var available_capacity = max_capacity




func build_warehouse():
	GlobalResources.cash -= WAREHOUSE_COST
	warehouses += 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

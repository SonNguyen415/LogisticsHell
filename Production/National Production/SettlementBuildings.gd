extends Node


class_name SettlementBuildings


const WAREHOUSE_SPACE = 1000
const WAREHOUSE_COST = 10


# Storage buildings
var warehouses
var max_capacity = warehouses*WAREHOUSE_SPACE
var available_capacity = max_capacity



# Settlement specific buildings
var markets
var temples
var hospitals
var defenses
var watchtowers
var barracks
var training_fields
var train_stations



# Production buildings
var idle_factories = 0
var medical_convoy_factories = 0
var medicine_factories = 0
var hygiene_factories = 0
var food_factories = 0
var ammunition_factories = 0
var weapon_factories = 0
var cloth_factories = 0

var farms = 0
var metal_mine = 0



func build_warehouse():
	GlobalResources.cash -= WAREHOUSE_COST
	warehouses += 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

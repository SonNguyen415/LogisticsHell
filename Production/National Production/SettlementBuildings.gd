extends Node
class_name SettlementBuildings

const WAREHOUSE_SPACE = 1000
const WAREHOUSE_COST = 10

# Storage buildings
var warehouses
var max_capacity = warehouses*WAREHOUSE_SPACE
var available_capacity = max_capacity

var idle_factories = 0
var medical_convoy_factories = 0
var medicine_factories = 0
var hygiene_factories = 0
var food_factories = 0
var ammunition_factories = 0
var weapon_factories = 0
var cloth_factories = 0

# Settlement specific buildings

# Civ
var markets
var temples
var farms = 0
var metal_mine = 0
var train_stations

# Def
var defenses
var watchtowers

# Milta
var hospitals
var barracks
var training_fields

func build_warehouse():
	# Builds a Warehouse (Supply Depot)
	if GlobalResources.cash >= WAREHOUSE_COST:
		GlobalResources.cash -= WAREHOUSE_COST
		warehouses += 1

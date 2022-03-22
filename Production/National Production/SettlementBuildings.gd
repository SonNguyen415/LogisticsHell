extends Node
class_name SettlementBuildings

const WAREHOUSE_SPACE = 1000
const WAREHOUSE_COST = 10

# Storage buildings
var warehouses
var max_capacity = warehouses*WAREHOUSE_SPACE
var available_capacity = max_capacity

# Maybe we can just make factories a class or something
var idle_factories = 0
var producing_factories = {"medical_convoy": 0, "medicine": 0, "hygiene": 0,
							"food": 0, "ammo": 0, "weapon": 0, "cloth": 0, "fish": 0}

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

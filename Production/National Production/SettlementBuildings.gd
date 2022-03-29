"""
---------------------------------------------------------------------------------------------------

[Insert file description]

Authors: Son Nguyen, Max Kim

---------------------------------------------------------------------------------------------------
"""

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

var civilian_buildings = {"market": 0, "temple": 0, "farm": 0, "mine": 0, "train station": 0}
var defense = {"defenses": 0, "watchtowers": 0}
var military_buildings = {"hospitals": 0, "barracks": 0, "training field": 0, "mustering ground": 0, "artillery field": 0}


func build_warehouse():
	# Builds a Warehouse (Supply Depot)
	if GlobalResources.cash >= WAREHOUSE_COST:
		GlobalResources.cash -= WAREHOUSE_COST
		warehouses += 1



# Self Explanatory Functions


# Builds 1 of something of a type
func build_civilian_building(type):
	civilian_buildings[type] += 1


func build_defense(type):
	defense[type] += 1


func build_military_building(type):
	military_buildings[type] += 1



func get_building_count(type, building_name):
	# Type: "civilian", "defense", "military"
	if type == "civilian":
		return civilian_buildings[building_name]
	elif type == "defense":
		return defense[building_name]
	elif type == "military":
		return military_buildings[building_name]

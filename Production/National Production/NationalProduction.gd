extends Node2D


var financial_officer = Characters.debug_QA

# Total number of buildings you have
var building_count = 0


# Special buildings, add up to building_count
var idle_buildings = 0
var medical_convoy_buildings = 0
var medicine_buildings = 0
var hygiene_buildings = 0
var food_buildings = 0
var ammunition_buildings = 0
var weapon_buildings = 0
var cloth_buildings = 0


# This building is special cuz it affects the global resource manpower
var recruitment_center = 0



# Build a new building
func construct_building():
	building_count += 1
	idle_buildings += 1
	
	
	
	
	
# Call this function whenever a building is allocated to production
func allocate_building(building):
	if(idle_buildings > 0):
		building += 1
		idle_buildings -= 1
	else:
		pass
		
		
# Every tick, we increase resources, this is represented as income
func change_global_resources():
	GlobalResources.cash += GlobalResources.tax_rate * (1 + financial_officer.financial_management / 100)
	GlobalResources.manpower += GlobalResources.recruitment_rate*(recruitment_center+1) * (1 + financial_officer.recruitment / 100)
	

func on_tick():
	change_global_resources()



func _ready():
	Time.connect("tick_generated", self, "on_tick")

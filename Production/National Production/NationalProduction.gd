extends Node2D

var building_count = 0

var idle_buildings = 0
var medical_convoy_buildings = 0
var medicine_buildings = 0
var hygiene_buildings = 0
var food_buildings = 0
var ammunition_buildings = 0
var weapon_buildings = 0
var cloth_buildings = 0



(export) var tax_office = 0
(export) var recruitment_center = 0

func construct_building():
	building_count += 1
	idle_buildings += 1
	
	
func allocate_building(building):
	if(idle_buildings > 0):
		building += 1
	else:
		pass
		
		



func _ready():
	pass # Replace with function body.

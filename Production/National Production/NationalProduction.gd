extends Node2D


var financial_officer = Characters.debug_QA

# Total number of factories you have
var factory_count = 0




# Special factories, add up to factory_count
var idle_factories = 0
var medical_convoy_factories = 0
var medicine_factories = 0
var hygiene_factories = 0
var food_factories = 0
var ammunition_factories = 0
var weapon_factories = 0
var cloth_factories = 0


# This factory is special cuz it affects the global resource manpower
var recruitment_center = 0



# Build a new factory
func construct_factory():
	factory_count += 1
	idle_factories += 1
	
	
	
# Call this function whenever a factory is allocated to production
func allocate_factory(factory):
	if(idle_factories > 0):
		factory += 1
		idle_factories -= 1
	else:
		pass
		
		
# Every tick, we increase resources, this is represented as income
func change_global_resources():
	GlobalResources.cash += GlobalResources.tax_rate * (1 + financial_officer.financial_management / 100)
	GlobalResources.manpower += GlobalResources.recruitment_rate*(recruitment_center+1) * (1 + financial_officer.recruitment / 100)
	




# Generate Stuff
func on_tick():
	change_global_resources()


# Connects the tick generation signal to the on_tick function
func _ready():
	Time.connect("tick_generated", self, "on_tick")

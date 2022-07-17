"""
---------------------------------------------------------------------------------------------------

This file contains functions that can be used for national production. 
National Production: menu that represents production from home country and not from settlements

Authors: Son Nguyen, Max Kim

---------------------------------------------------------------------------------------------------
"""

extends Node2D



# Total number of factories you have
var factory_count = 0

# Special factories, add up to factory_count
var idle_factories = 0
var producing_factories = {"medical_convoy": 0, "medicine": 0, "hygiene": 0,
							"food": 0, "ammo": 0, "weapon": 0, "cloth": 0, "fish": 0}

# This factory is special cuz it affects the global resource manpower
var recruitment_center = 0


# Build a new factory
func construct_factory():
	factory_count += 1
	idle_factories += 1
	
# Call this function whenever a factory is allocated to production
func allocate_factory(factory_type):
	if(idle_factories > 0):
		producing_factories[factory_type] += 1
		idle_factories -= 1

func deallocate_factory(factory_type):
	if(producing_factories[factory_type] > 0):
		producing_factories[factory_type] -= 1
		idle_factories += 1

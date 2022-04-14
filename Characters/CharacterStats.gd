"""
---------------------------------------------------------------------------------------------------

A characterstats class that stores stats of characters
Meant to be attached to a character to represent the character's stats
Also meant to be called to obtain said character's stats

Authors: Max Kim, Oliver Krisetya

---------------------------------------------------------------------------------------------------
"""

extends Resource
class_name CharacterStats

# Last Updated 4/13/22


# Teir Stats
export (int) var tier = 3# 3star, 4star, 5star...

export (int) var health = 100
export (int) var luck = 10


#Administration Stats
export (int) var diplomacy = 10
export (int) var architect = 10
export (int) var financial_management = 10
export (int) var food_production = 10
export (int) var quartermaster = 10
export (int) var hospital_management = 10
export (int) var transportation = 10
export (int) var innovation = 10
export (int) var recruitment = 10


# General Stats 
export (int) var logistics = 10
export (int) var offense = 10
export (int) var defense = 10
export (int) var siege = 10
export (int) var maneuver = 10
export (int) var charisma = 10
export (int) var drill = 10
export (int) var tactics = 10
export (int) var retreat = 10

export (int) var cavalry_bonus = 10
export (int) var infantry_bonus = 10
export (int) var artillery = 10

# Personality Stats
export (String) var attribute


#Functions


# Randomizes and generates general stats given
# specific high and low stats of the general

func generate_gen_stats(high_stats, low_stats, tier):
	# Base zero stats
	var stats_dict = {"Logistics": 0,
					 "Offense": 0,
					 "Defense": 0,
					 "Siege": 0,
					 "Maneuver": 0,
					 "Charisma": 0,
					 "Drill": 0,
					 "Tactics": 0,
					 "Retreat": 0} 
	var max_stats = preload("res://Characters/Characters/Debug/MaxStats.tres")
	print(max_stats.new())
	
	return stats_dict

func generate_adm_stats(high_stats, low_stats):
	return 1

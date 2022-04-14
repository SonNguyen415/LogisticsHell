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

# Last Updated 4/14/22


# Teir Stats
export (int) var tier = 3 # 3star, 4star, 5star...

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


var rng = RandomNumberGenerator.new()

#Functions


# Randomizes and generates general stats given
# specific high and low stats of the general

func generate_gen_stats(high_stats, low_stats, tier):
	# Base zero stats
	var stats_dict = {"logistics": 0,
					 "offense": 0,
					 "defense": 0,
					 "siege": 0,
					 "maneuver": 0,
					 "charisma": 0,
					 "drill": 0,
					 "tactics": 0,
					 "retreat": 0} 

	# Get max natural generated stats for
	# 5-star general to be used to calculate
	# tier ranges
	
	"""
	TO DO: READ RESOURCE FILE 
	"""
	var max_natstats_dict = {"max_logistics": 100,
							"max_offense": 100,
							"max_defense": 100,
							"max_maneuver": 100,
							"max_charisma": 100,
							"max_drill": 100,
							"max_tactics": 100,
							"max_retreat": 100}
	
	for maxstat in max_natstats_dict:
		for stat in stats_dict:
			if stat in maxstat:
				# Calculate divisons 
				var maximum = maxstat * ((tier%3+1)/3)
				var minimum = maxstat * ((tier%3)/3)
				
				if stat in high_stats:
					var value = rng.randi_range(2*(maximum/3),maximum)
					stat.add(value)
				elif stat in low_stats:
					var value = rng.randi_range(1,maximum/3)
					stat.add(value)
				else:
					var value = rng.randi_range((maximum/3),2*(maximum/3))
					stat.add(value)
						
		
	return stats_dict

func generate_adm_stats(high_stats, low_stats):
	return 1

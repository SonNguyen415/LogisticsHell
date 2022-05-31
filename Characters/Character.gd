"""
---------------------------------------------------------------------------------------------------

A character base class
Stores information about the character, from stats to their skill tree

Authors: Max Kim

---------------------------------------------------------------------------------------------------
"""

extends Resource
class_name Character

export (String) var name
export (String) var whatever
export (int) var experience
export (int) var level
var currentLevelCap
var tier
var levelPoints



var rng = RandomNumberGenerator.new()

#functions

func levelUpPoints():
	levelPoints = levelPoints + 1

func setTier(num):
	if(num <= 160):
		return 1
	elif(num >= 161 && num <= 199):
		return 2
	elif(num == 200):
		return 3
	else:
		return 0

func addXP(xp):
	experience = experience + xp

func levelUp():
	if(experience >= currentLevelCap):
		level = level + 1
		var temp = currentLevelCap - experience
		experience = temp
		levelUpPoints()


#constructor

func _init():
	level = 1
	
	var tierRating = rng.randf_range(1,200)
	tier = setTier(tierRating)

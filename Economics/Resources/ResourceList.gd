"""
---------------------------------------------------------------------------------------------------

This file contains the list of resources in the game

Authors: Max Kim, Son Nguyen

---------------------------------------------------------------------------------------------------
"""

extends Node2D

# Raw Materials

""" 
Commented out for now because it might be better to express these as pure quantities in tiles

var grain = Resources.instance("Grain")
var fodder = Resources.instance("Fodder")
var horses = Resources.instance("Horses")
var animals = Resources.instance("Animals")
var rocks = Resources.instance("Rock")
var clay = Resources.instance("Clay")
var wood = Resources.instance("Wood")
var plants = Resources.instance("Plants")
var iron_ore = Resources.instance("Iron Ore")
var water = Resources.instancce("Water")

# Adding another one down the line should be straightforward
# Also update the dictionary in that case
# Also if anything has special behavior i.e. food, then just create a dependent class or sth

# Raw Material Dictionary
var raw_material_dictionary = {"Grain": grain, "Wood": wood, "Fodder": fodder, "Clay": clay,
								"Horses": horses, "Animals": animals, "Rocks": rocks, "Plants": plants,
								"Iron Ore": iron_ore, "Water": water}
""" 





# Processed Materials
var food = Food.instance("Food")
var purified_water = Resources.instance("Water")
var war_horses = Resources.instance("War Horses")
var oxens = Resources.instance("Oxens")
var leather = Resources.instance("Leather")
var bricks = Resources.instance("Bricks")
var stone = Resources.instance("Stone")
var lumber = Resources.instance("Lumber")
var herbs = Resources.instance("Herbs")
var cloth = Resources.instance("Cloth")
var iron = Resources.instancce("Iron")


# Processed Materials Dictionary
var processed_materials_dictionary = {"Food": food, "Purified Water": water, "War Horses": war_horses, 
								"Oxens": oxens, "Leather": leather, "Bricks": bricks, "Stone": stone, 
								"Lumber": lumber, "Herbs": herbs, "Cloth": cloth, "Iron": iron}





# Manufactured Materials
var amenities =  Resources.instance("Amenities")
var tents = Resources.instance("Tents")
var steel = Resources.instance("Steel")
var medicine = Resources.instance("Medicine")
var bandaging = Resources.instance("Bandaging")

var wagons = Vehicles.instance("Wagons")
var carts = Vehicles.instance("Carts")

# Manufactured Material Dictionary
var manufactured_materials_dictionary = {"Amenities": amenities, "Tents": tents, "Steel": steel, 
									"Medicine": medicine, "Bandaging": bandaging, "Wagons": wagons,
									"Carts": carts}




# For the time being I'll only include the first several items that'll probably be used

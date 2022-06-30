"""
---------------------------------------------------------------------------------------------------

This file contains the list of resources in the game

Authors: Max Kim

---------------------------------------------------------------------------------------------------
"""

extends Node2D

# Raw Materials
var food = Food.instance("Food")
var wood = Resources.instance("Wood")
var copper = Resources.instance("Copper")
var cloth = Resources.instance("Cloth")
var iron = Resources.instance("Iron")
var steel = Resources.instance("Steel")
var glass = Resources.instance("Glass")
var gunpowder = Resources.instance("Gunpowder")
var smokeless_powder = Resources.instance("Smokeless Powder")
var horses = Resources.instance("Horses")
var coal = Resources.instance("Coal")
var oil = Resources.instance("Oil")
var electricity = Resources.instance("Electricity")

# Adding another one down the line should be straightforward
# Also update the dictionary in that case
# Also if anything has special behavior i.e. food, then just create a dependent class or sth

# Raw Material Dictionary
var raw_material_dictionary = {"Food": food, "Wood": wood, "Copper": copper, "Cloth": cloth,
								"Iron": iron, "Steel": steel, "Glass": glass, "Gunpowder": gunpowder,
								"Smokeless Powder": smokeless_powder, "Horses": horses, "Coal": coal, "Oil": oil,
								"Electricity": electricity,}


# Manufactured Materials
var bows = Resources.instance("Bows")
var arrows = Resources.instance("Arrows")
var musket = Resources.instance("Musket")
var matchlock = Resources.instance("Matchlock")
var arquebus = Resources.instance("Arquebus")
var muzzle_rifles = Resources.instance("Muzzle Rifles")
var breech_rifles = Resources.instance("Breech Rifles")
var gatling_guns = Resources.instance("Gatling Guns")
var bayonets = Resources.instance("Bayonets")
var sabers = Resources.instance("Sabers")
var longswords = Resources.instance("Longswords")
var rapiers = Resources.instance("Rapiers")
var field_artillery = Resources.instance("Field Artillery")
var siege_artillery = Resources.instance("Siege Artillery")
var howitzers = Resources.instance("Howitzers")
var mortars = Resources.instance("Mortars")
var lances = Resources.instance("Lances")
var pikes = Resources.instance("Pikes")
var plate_armor = Resources.instance("Plate Armor")
var cuirasses = Resources.instance("Cuirasses")
var helmets = Resources.instance("Helmets")
var uniforms = Resources.instance("Uniforms")
var boots = Resources.instance("Boots")
var hygiene = Resources.instance("Hygiene")
var toilet_paper = Resources.instance("Toilet Paper")
var bandaids = Resources.instance("Bandaids")
var penicillin = Resources.instance("Penicillin")
var gauze = Resources.instance("Gauze")
var stone = Resources.instance("Stone")
var bricks = Resources.instance("Bricks")
var wagons = Resources.instance("Wagons")
var boats = Resources.instance("Boats")
var automobiles = Resources.instance("Automobiles")

# Manufactured Material Dictionary
# For the time being I'll only include the first several items that'll probably be used
var manufactured_material_dictionary = {"Bows": bows, "Arrows": arrows, "Musket": musket, "Matchlock": matchlock,}
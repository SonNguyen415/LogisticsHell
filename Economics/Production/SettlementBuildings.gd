"""
---------------------------------------------------------------------------------------------------

Settlement Building Code
Stores information about the buildings of a settlement and their corresponding production rates

Authors: Son Nguyen, Max Kim

---------------------------------------------------------------------------------------------------
"""

extends Node

class_name SettlementBuildings





# Storage buildings
var warehouses = 0
var max_capacity = warehouses*Defines.WAREHOUSE_SPACE
var available_capacity = max_capacity


# Maybe we can just make factories a class or something

var idle_factories = 0
var producing_factories = {"medical_convoy": 0, "medicine": 0, "hygiene": 0,
							"food": 0, "ammo": 0, "weapon": 0, "cloth": 0, "fish": 0}
var factory_rate = {"medical_convoy": 0, "medicine": 0, "hygiene": 0,
					"food": 0, "ammo": 0, "weapon": 0, "cloth": 0, "fish": 0}


# Settlement specific buildings
var civilian_buildings = {"market": 0, "temple": 0, "farm": 0, "mine": 0, "train station": 0}
var defense = {"defenses": 0, "watchtowers": 0}
var military_buildings = {"hospitals": 0, "barracks": 0, "training field": 0, "mustering ground": 0, "artillery field": 0}


#walls and related seige stuff
var wall = {"hp":0,"quality":0,"maxHP":0,"maxQuality":0}
var watchtower ={ "hp":0,"maxHP":0,"quality":0,"maxQuality":0} #might need to make walls and watchtowers individual classes.
var settlementFood = 0.0 #food defenders have stored. if this hits 0, seige ends successfully for attacker.
#food is likely a temp value.
bool currentSeige = false;
bool breach  = true



# Function to build a factory, adding to the number of idle factories
func build_factory():
	if GlobalValues.cash >= Defines.FACTORY_COST:
		GlobalValues.cash -= Defines.FACTORY_COST
		idle_factories += 1


# Function to build a warehouse
func build_warehouse():
	if GlobalValues.cash >= Defines.WAREHOUSE_COST:
		GlobalValues.cash -= Defines.WAREHOUSE_COST
		warehouses += 1



# Function to build one civilian type building
func build_civilian_building(type):
	civilian_buildings[type] += 1


# Function to build one defense type building
func build_defense(type):
	defense[type] += 1


# Function to build one military type building
func build_military_building(type):
	military_buildings[type] += 1



# Function to  provide a count of how many buildings of a types
func get_building_count(type, building_name):
	# Type: "civilian", "defense", "military"
	if type == "civilian":
		return civilian_buildings[building_name]
	elif type == "defense":
		return defense[building_name]
	elif type == "military":
		return military_buildings[building_name]

#function to go into seige mode
func seige_attack(BattalionUnit):

	if(): #batallion attacks settlement. need help w/ this.
        currentSeige = true
        seigeOngoing(BattallionUnit)
        end_seige(BattalionUnit)

#function to abruptly end a seige
func seige_ongoing(BattalionUnit):
	if(): #batallion attacks settlement
		wall.hp -= BattalionUnit.totalDamages()*0.3*BattalionUnit.seigeDamage
		watchtower.hp -= BatallionUnit.totalDamages()*0.2*BattalionUnit.seigeDamage
		#need help calculating Quality loss here
		wall.quality--
		#needs to roll breach chance here

		if((randi % 100) > wall.quality):
			ongoing = false
			breach = true


#function to abruptly end a seige-
func end_siege(BattalionUnit):

    #seige successful
	if(wall.hp == 0 or wall.quality == 0):
		currentSeige = false
		#conditions that happen here
	if(settlementFood == 0):
		#needs to end seige entirely- code below subject to change
		currentSeige = false
		#other conditions due to starvation
    if(breach)
        currentSeige = false
        #effects to happen



	#seige failed  conditions here
    if(Batallion.discipline <= 0 or BatallionUnit.troop_strength <= 0 )
        currentSeige = false

#if conditions are not met seige will continue.



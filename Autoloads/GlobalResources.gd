
"""
---------------------------------------------------------------------------------------------------

This file keeps some constants and values for global resources

Authors: Son Nguyen

---------------------------------------------------------------------------------------------------
"""

extends Node

class_name GlobalValues


# Constant (Base) Production Values
const TAX_RATE = 10
const HUMAN_RECRUITMENT = 10


const CONVOY_PRODUCTION = 100
const MEDICINE_PRODUCTION = 100
const HYGIENE_PRODUCTION = 1000
const FOOD_PRODUCTION = 1000
const AMMUNITION_PRODUCTION = 1000
const WEAPON_PRODUCTION = 100
const CLOTH_PRODUCTION = 100


# Building values
const WAREHOUSE_SPACE = 1000
const WAREHOUSE_COST = 10

const FACTORY_COST = 15
const BUILDING_COST = 15


var START_CASH_1 = 10000
var START_MANPOWER_1 = 10000
var START_INNOVATIVENESS_1 = 50






var cash 
var manpower
var connections
var innovativeness


# Global modifiers
var tax_mod = 1.0
var production_mod = 1.0
var trade_mod = 1.0
var recruit_cost_mod = 1.0
var recruit_time_mod = 1.0
var build_cost_mod = 1.0
var build_time_mod = 1.0




# Initialize our income as equal to the constants
var tax_income = TAX_RATE * tax_mod
var recruitment_rate = HUMAN_RECRUITMENT * recruit_time_mod



# I want this function to be called at the start of each act
# We will have a csv to store starting value of each act, import it and set the starting values here
func _init():
	# cash = START_CASH
	pass









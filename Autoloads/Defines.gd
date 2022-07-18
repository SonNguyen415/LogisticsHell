
"""
---------------------------------------------------------------------------------------------------

This file keep all constant values and definitions required for the game

Authors: Son Nguyen, Max Kim, Oliver Krisetya, Warren Nguyen

---------------------------------------------------------------------------------------------------
"""

extends Node



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



# starting values for each act (we'll use a csv instead later
var START_CASH_1 = 10000
var START_MANPOWER_1 = 10000
var START_INNOVATIVENESS_1 = 50



# Battalion Values
const MAX_BATTALION_SIZE = 500
var base_max_morale = 100.0
const MORALE_THRESHOLD = 10.0
var base_morale_recovery = .2

const MAX_WEARINESS = 100
var base_weariness_increase = 0.5
var base_weariness_decrease = 1

var attack_constant = .1

# Vehicles values
const WAGON_SPEED = 5
const CART_SPEED = 8
const WAGON_CAPACITY = 100
const CART_CAPACITY = 100





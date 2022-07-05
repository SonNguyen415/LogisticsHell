"""
---------------------------------------------------------------------------------------------------

This file contains all the global resource count pertaining to player civilization

Authors: Son Nguyen

---------------------------------------------------------------------------------------------------
"""



extends Node
class_name GlobalValues


# Global resource
var cash 
var manpower

# Monthly income and recruitment rate
var tax_income 
var recruitment_rate
var total_recruitment=recruitment_rate

# Global modifiers
var tax_mod = 1.0
var production_mod = 1.0
var trade_mod = 1.0
var recruit_cost_mod = 1.0
var recruit_time_mod = 1.0
var build_cost_mod = 1.0 
var build_time_mod = 1.0

	


# I want this function to be called at the start of each act
# We will have a csv to store starting value of each act, import it and set the starting values here
func _init():
	# load starting cash and manpower from whatever csv
	# same for tax income and recruitment rate
	pass


# Every 43200 ticks (1 month), we increase resources, this is represented as income
func update_monthly_income():
	cash += tax_income
	manpower += total_recruitment
	
	
func update_recruitment_rate(buildings):
	total_recruitment=recruitment_rate*buildings


# Generate Stuff each tick
func on_tick():
	pass


# Connects the tick generation signal to the on_tick function
func _ready():
	Time.connect("tick_generated", self, "on_tick")


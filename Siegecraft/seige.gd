  """
---------------------------------------------------------------------------------------------------

Authors: Ace Drucker
---------------------------------------------------------------------------------------------------
"""

extends KinematicBody2D


#member variables
var ABat = 0 #amount of batallions in the attacking army
var DBat = 0 #amount of batallions defending from the attacking army
var ongoing = true; #ongoing needs to be modified for specific cases

#wall values, will problably get moved to a method
var wallHP = 0.0 #e.g. health of wall. if seige weapons do enough damage, battle will turn into regular battle
var wallQual = 0.0 #quality of a wall e.g. when this hits 0, turns into regular battle
var maxWallQual = 100 #value stored is full wall qual. 
var food = 0.0 #food defenders have stored. if this hits 0, seige ends successfully for attacker
var wTHP = 0.0 #watchtower hp

var damageDealt = 0.0 #damage done by troops to walls/towers.
var wepBoost = 0.0 #boost to defences by specific weapons 
var isMelee = false #is attacking wep a melee weapon
var isSeige = false #is attacking wep a seige weapon
var breach = false #is there a breachc in defences?
#objects go here- like specific armies, batallions, troops


#seige base conditions here
func endSiege(beta):
	if(wallHP == 0 or wallQual == 0):
		ongoing = false
	if(food == 0):
		#needs to end seige entirely- code below subject to change
		ongoing = false
"""
func trigger(alpha): #seige trigger conditions
	

"""


#takes in base damage, calculates wall damage
func damageWall(gamma): #i dont know how damage works, this will be blank until then. 
	if(isSeige == true):
		wallHP -= damageDealt*0.3*wepBoost
		wTHP -= damageDealt*0.2*wepBoost
		#need help calculating Quality loss here
		 #needs to roll breach chance here
		wallQual--
		if((randi % 100) > wallQual):
			ongoing = false
			breach = true



#breach conditions here



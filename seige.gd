"""
---------------------------------------------------------------------------------------------------

Authors: Ace Drucker
---------------------------------------------------------------------------------------------------
"""

extends KinematicBody2D


#member variables
var ABat = 0 #amount of batallions in the attacking army
var DBat = 0 #amount of batallions defending from the attacking army


#wall values, will problably get moved to a method
var wallHP = 0.0 #e.g. health of wall. if seige weapons do enough damage, battle will turn into regular battle
var wallQual = 0.0 #quality of a wall e.g. when this hits 0, turns into regular battle
var food = 0.0 #food defenders have stored. if this hits 0, seige ends successfully for attacker

#objects go here- like specific armies, batallions, troops


#seige base conditions here

func trigger(alpha): #seige trigger conditions

func endSiege(beta):

func damageWall(gamma):



#breach conditions here



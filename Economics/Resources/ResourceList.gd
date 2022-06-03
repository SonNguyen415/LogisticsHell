"""
---------------------------------------------------------------------------------------------------

This file contains the list of resources in the game

Authors: Max Kim

---------------------------------------------------------------------------------------------------
"""

extends Node2D

export (Script) var RawMaterials
export (Script) var ManufacturedMaterials

# The template dictionary for a number of materials at a
var material_list

func _ready():
	# Instantiates the global resource 
	#material_list = RawMaterials.material_list + ManufacturedMaterials.material_list
	pass

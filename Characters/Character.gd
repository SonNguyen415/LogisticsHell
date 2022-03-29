"""
---------------------------------------------------------------------------------------------------

A character base class
Stores information about the character, from stats to their skill tree

Authors: Max Kim

---------------------------------------------------------------------------------------------------
"""

extends Resource
class_name Character

export (Resource) var stats
export (Resource) var skill_tree
export (Resource) var constellations
export (String) var name
export (String) var whatever

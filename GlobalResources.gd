extends Node

(export) var cash = 10000
(export) var manpower = 10000
(export) var connections = 100

var tax_rate = 10
var human_recruitment = 10


var medical_convoy_production = 100
var medicine_production = 100
var hygiene_production = 1000
var food_production = 1000
var ammunition_production = 1000
var weapon_production = 100
var cloth_production = 100


func on_tick():
	cash += 10


# Called when the node enters the scene tree for the first time.
func _ready():
	Time.connect("tick_generated", self, "on_tick")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

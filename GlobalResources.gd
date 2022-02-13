extends Node

(export) var cash = 10000
(export) var manpower = 10000
(export) var connections = 100

const tax_rate = 10
const human_recruitment = 10


const medical_convoy_production = 100
const medicine_production = 100
const hygiene_production = 1000
const food_production = 1000
const ammunition_production = 1000
const weapon_production = 100
const cloth_production = 100


func on_tick():
	cash += 10


# Called when the node enters the scene tree for the first time.
func _ready():
	Time.connect("tick_generated", self, "on_tick")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

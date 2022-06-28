extends Node2D


class_name BattalionUnit

var MAX_BATTALION_SIZE = 500

var MIN_MORALE = 1
var BASE_MORALE = 5
var BASE_MORALE_RECOVERY = .2

var MAX_WEARINESS = 100
var BASE_WEARINESS_INCREASE = 0.5
var BASE_WEARINESS_DECREASE = 1

var morale = maximum_morale
var morale_recovery = BASE_MORALE_RECOVERY
var maximum_morale = BASE_MORALE

var weariness = 0
var weariness_increase = BASE_WEARINESS_INCREASE
var weariness_decrease = BASE_WEARINESS_DECREASE

var troop_strength = MAX_BATTALION_SIZE
var wounded = 0
var sick = 0
var total_troops = troop_strength + wounded + sick

var activity = true
var fighting = false
var resting = false

var shock = 10
var discipline = 10
var assault = 10
var retaliation = 5
var fortitude = 10
var lethality = 0.3

var total_losses = 0;

var assault_dmg
var retaliation_dmg

var incoming_shock = 0

var troop_type

func _ready():
	pass

func losses(incoming_assault, incoming_retaliation):
	total_losses = (incoming_assault + incoming_retaliation) - fortitude

func total_damages():
	assault_dmg = troop_strength*assault*morale
	retaliation_dmg = troop_strength*retaliation*morale

func check_morale():
	if (morale < 0):
		morale = 0
	if (morale == 0):
		activity = false

func update_weariness():
	if (fighting == false and resting == false):
		weariness += weariness_increase
	elif (fighting == true):
		weariness += weariness_increase*2
	elif (resting == true):
		weariness -= weariness_decrease
		
	if (weariness < 0):
		weariness = 0
	if (weariness == 0):
		activity = false

func _init(unit_type = "Infantry"):
	troop_type = unit_type

func _process(delta):
	if (fighting == true):
		total_damages()
	
	total_troops = troop_strength + wounded + sick
	
	check_morale()
	update_weariness()
	
	if (activity == false and morale == MIN_MORALE):
		activity = true
	if (morale < maximum_morale and fighting == false):
		morale += morale_recovery
		
	
	

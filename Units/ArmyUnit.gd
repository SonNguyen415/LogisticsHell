"""
---------------------------------------------------------------------------------------------------

[Insert file description]

Authors: Warren Nguyen

---------------------------------------------------------------------------------------------------
"""


extends KinematicBody2D

var clicked = false
var hovering = false
var movement_speed = 10
var selectable = false
var destinationX 
var destinationY 
var team

var initial_battalion = preload("res://Units/BattalionUnit.tscn").instance()
var army_width = 4
var army_depth = 1

var battalion_matrix

var infantry_list = []
var cavalry_list = []
var archer_list = []
var artillery_list = []

func create_2d_array(width):
	var a = []
	army_depth = (infantry_list.size() + cavalry_list.size() + archer_list.size() + artillery_list.size())/width + 1
	
	for y in range(army_depth):
		a.append([])
		a[y].resize(army_width)
	
	if (infantry_list.size() == 1):
		a[0][(width/2).round()] = infantry_list.erase()
	elif (infantry_list.size() >= (width*.75).round()):
		pass
	elif (cavalry_list.size() > 1):
		pass
	return a

func formation_matrix():
	battalion_matrix = create_2d_array(army_width)


func _init(team_allocation = "Player", infantry_amount = [], archer_amount = [], cavalry_amount = [], artillery_amount = []):
	team = team_allocation
	infantry_list = infantry_amount
	archer_list = archer_amount
	cavalry_list = cavalry_amount
	artillery_list = artillery_amount
	

# Called when the node enters the scene tree for the first time.
func _ready():
	destinationX = global_position.x
	destinationY = global_position.y
	
	if (team == "Player"):
		selectable = true

#Army movement, if the distance is more than 2 times the movement speed, move

func _process(delta):
	var distance = global_position.distance_to(Vector2(destinationX, destinationY));
	if (distance > movement_speed*2):
		var cosine = (destinationX-global_position.x)/distance
		var sine = (destinationY-global_position.y)/distance
		global_position.x += cosine*movement_speed
		global_position.y += sine*movement_speed
	elif clicked == false:
		modulate = Color.white

#Player input, if you click on the army, it selects it, click on it again, deselects, right click somewhere, activates movement

func _input(event):
	if (selectable == true):
		if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
			if hovering == true and clicked == false:
				clicked = true
				modulate = Color.red
			elif hovering == true and clicked == true:
				clicked = false
				modulate = Color.white
		elif event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_RIGHT:
			if clicked == true:
				destinationX = get_global_mouse_position().x
				destinationY = get_global_mouse_position().y

func _on_Area2D_mouse_entered():
	hovering = true


func _on_Area2D_mouse_exited():
	hovering = false


func _on_Area2D_body_entered(body):
	if body.team != team:
		print("HUZZAH")

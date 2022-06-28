extends KinematicBody2D


# All variables for unit army
var movementSpeed = 10
var movementReduction = 0;
var positionX = 0;
var positionY = 0;
var destinationX = 0;
var destinationY = 0;
var selected = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if selected:
		pass
	pass

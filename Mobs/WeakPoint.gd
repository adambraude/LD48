extends Area2D


# Declare member variables here. Examples:
export var damage = 1

var collidingObjs = []

signal damageTaken

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("area_entered", self, "onAreaEntered")
	pass # Replace with function body.

func _process(delta):
	if (collidingObjs).size() > 0:
		emit_signal("damageTaken", damage)

func onAreaEntered(area):
	collidingObjs.append(area)
	pass # Replace with function body.


func onAreaExited(area):
	collidingObjs.remove(collidingObjs.find(area))
	pass # Replace with function body.

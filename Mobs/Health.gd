extends Node2D


# Declare member variables here. Examples:
export var maxHealth = 100.0
var currentHealth = maxHealth

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func takeDamage(damage):
	print("taking " + str(damage) + " damage")
	currentHealth -= damage;
	if currentHealth < 0:
		currentHealth = 0
	$Bar.rect_scale = Vector2(currentHealth/maxHealth, 1)

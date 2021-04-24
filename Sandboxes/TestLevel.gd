extends Node2D


# Declare member variables here. Examples:
var gameStarted: bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_accept") && !gameStarted:
		gameStarted = true
		$BeforeLevelMenu.queue_free()
		start_level()
	
func start_level():
	$Player.start($PlayerStartPosition.position)

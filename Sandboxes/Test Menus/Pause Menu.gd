extends MarginContainer


# Declare member variables here. Examples:
var paused: bool = false
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if !paused:
			pause()
		else:
			unpause()

func pause():
	paused = true
	get_tree().paused = true
	show()
	pass

func unpause():
	paused = false
	hide()
	get_tree().paused = false
	pass


func _on_Resume_pressed():
	unpause()


func _on_MainMenu_pressed():
	paused = false
	go_to_main_menu()

func go_to_main_menu():
	get_tree().paused = false
	get_tree().change_scene("res://Sandboxes/Test Menus/Menu.tscn")

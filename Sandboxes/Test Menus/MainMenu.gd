extends MarginContainer


# Declare member variables here. Examples:
#var current_scene


# Called when the node enters the scene tree for the first time.
func _ready():
	#var root = get_tree().get_root()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Options_pressed():
	get_tree().change_scene("res://Sandboxes/Test Menus/Options.tscn")


func _on_EasyDifficulty_pressed():
	get_tree().change_scene("res://Sandboxes/Sandbox - Adam-easy.tscn")


func _on_HardDifficulty_pressed():
	get_tree().change_scene("res://Sandboxes/Sandbox - Adam.tscn")


func _on_Quit_pressed():
	close_game()

func close_game():
	get_tree().quit()

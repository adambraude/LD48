extends MarginContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var musicOn


# Called when the node enters the scene tree for the first time.
func _ready():
	musicOn = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://Sandboxes/Test Menus/Menu.tscn")


func _on_MusicOnOff_toggled(button_pressed):
	var button = get_node("HBoxContainer/MenuOptions/Sound/MusicOnOff")
	
	#AllMusicPlayer.pause()
	
	if musicOn:
		musicOn = false
	else:
		musicOn = true
	
	if musicOn:
		AllMusicPlayer.unpause()
	else:
		AllMusicPlayer.pause()
	
	

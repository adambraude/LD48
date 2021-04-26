extends Node


# Declare member variables here. Examples:
#var children
var index
var children
var rng
var manualPause
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#children = shuffleList(children)
	rng = RandomNumberGenerator.new()
	manualPause = false
	playSong()

func song_finished():
	playSong()

# Just picks a random song from the list. I tried to have it cycle through all
# of the songs first, but couldn't seem to get it to work
func playSong():	
	#print(get_child_count())
	if manualPause:
		return
	rng.randomize()
	
	index = rng.randi_range(0, get_child_count()-1)

	var song = get_child(index)
	song.play()

func pause():
	manualPause = true
	var song = get_child(index)
	song.stop()

func unpause():
	manualPause = false
	playSong()
# Doesn't seem to work
#func shuffleList(list):
#	var shuffledList = [] 
#	var indexList = range(list.size())
#	for i in range(list.size()):
#		var x = randi()%indexList.size()
#		shuffledList.append(list[indexList[x]])
#		indexList.remove(x)
#	return shuffledList
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

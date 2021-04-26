extends Node


# Declare member variables here. Examples:
#var children
var index
var children
var rng
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#children = shuffleList(children)
	rng = RandomNumberGenerator.new()
	playSong()

func song_finished():
	playSong()

func playSong():	
	print(get_child_count())
	rng.randomize()

	var song = get_child(rng.randi_range(0, get_child_count()-1))
	song.play()

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

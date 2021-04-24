extends Label


# Declare member variables here. Examples:
var blink_timer


# Called when the node enters the scene tree for the first time.
func _ready():
	blink_timer = Timer.new()
	blink_timer.connect("timeout", self, "_on_blink_timeout")
	add_child(blink_timer)

func _on_blink_timeout():
	if is_visible():
		hide()
	else:
		show()

func start_blinking(interval):
	blink_timer.set_wait_time(interval)
	blink_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

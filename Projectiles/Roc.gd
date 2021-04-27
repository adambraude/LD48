extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var scl = Vector2.ONE*(randf()*1.0 + 0.8)
	$Sprite.scale *= scl
	$Area2D.scale *= scl
	self.angular_velocity += randf()*30 + 10
	self.rotation_degrees = randf()*360
	self.linear_velocity += Vector2.DOWN*(120 + randf()*40)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.position.y > 2000:
		queue_free()
	pass

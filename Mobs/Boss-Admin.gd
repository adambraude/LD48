extends Node2D


var damageCounter = 0

const damageLimit = 5


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	$VulnModel/AnimationPlayer.play("offscreen")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func beginFight():
	$VulnModel/AnimationPlayer.play("enter")
	show()
	pass

func revealWeakPoint():
	pass

func onWeakPointDamageTaken(damage):
	damageCounter += 1
	if (damageCounter >= damageLimit):
		$VulnModel/AnimationPlayer.play("Exit")
		damageCounter = 0
		pass

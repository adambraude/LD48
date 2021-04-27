extends Node2D


var damageCounter = 0

const damageLimit = 5

var tensionCounter = 0
var tensionLimit = 10

var lastAttack = "attack_low_1"

export var difficulty = 1.3
var roxused = false

var rockScene = preload("res://Projectiles/Roc.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	$VulnModel/AnimationPlayer.play("offscreen")
	$AttackingModel/AnimationPlayer.play("offscreen")
	$AttackingModel/AnimationPlayer.playback_speed = 1*difficulty
	$RocksTimer.wait_time *= 1/difficulty
	$RocksTimer2.wait_time *= 1/difficulty
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func beginFight():
	$AttackingModel/AnimationPlayer.play("attack_low_l")
	show()
	pass

func onAnimationFinished(anim_name):
	if anim_name == "enter" or anim_name == "offscreen":
		return
	if tensionCounter > tensionLimit:
		tensionLimit += 2
		$VulnModel/AnimationPlayer.play("enter")
		tensionCounter = 0
	else:
		var attackSet = ["attack_low_l", "attack_lower_l", "attack_high_l","attack_low_r", "attack_lower_r", "attack_high_r"]
		if $Health.currentHealth < $Health.maxHealth*2/3 and not roxused:
			attackSet += ["offscreen2"]
		if $Health.currentHealth < $Health.maxHealth*1/2:
			attackSet += ["attack_highlo", "attack_highlo2"]
		$RocksTimer.stop()
		# Don't do an attack twice in a row
		attackSet.remove(attackSet.find(lastAttack))
		var chosenAttack = attackSet[randi()%attackSet.size()]
		lastAttack = chosenAttack
		$AttackingModel/AnimationPlayer.play(chosenAttack)
		if (chosenAttack == "offscreen2"):
			$RocksTimer.start()
			tensionCounter += 1
			roxused = true
		if (chosenAttack == "attack_highlo" or chosenAttack == "attack_highlo2"):
			tensionCounter += 5
		tensionCounter += 1
	if $Health.currentHealth < $Health.maxHealth*2/3:
		$AttackingModel/AnimationPlayer.playback_speed = 1.1*difficulty
	if $Health.currentHealth < $Health.maxHealth*1/2:
		$AttackingModel/AnimationPlayer.playback_speed = 1.2*difficulty
	if $Health.currentHealth < $Health.maxHealth*1/5:
		$AttackingModel/AnimationPlayer.playback_speed = 1.3*difficulty
	pass # Replace with function body.


func _on_RocksTimer_timeout():
	var newRock = rockScene.instance()
	newRock.position.y = -300
	newRock.position.x = 150 + 1600*randf()
	add_child(newRock)
	pass # Replace with function body.


func onDamageTaken():
	damageCounter += 1
	if (damageCounter >= damageLimit):
		roxused = false
		$VulnModel/AnimationPlayer.play("Exit")
		damageCounter = 0
		if $Health.currentHealth < $Health.maxHealth*1/5 and $RocksTimer2.is_stopped():
			$RocksTimer2.start()
	pass # Replace with function body.

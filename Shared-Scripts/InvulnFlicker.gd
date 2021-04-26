extends AnimationPlayer


func startAnim():
	self.play("Invuln Flicker")
	
func stopAnim():
	self.seek(0, true)
	self.stop()

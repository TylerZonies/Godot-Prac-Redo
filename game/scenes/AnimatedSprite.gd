extends AnimatedSprite

var direction = ""

func _on_KinematicBody2D_movement(velocity):
	if velocity.x > 0: 
		if velocity.y > 0:
			play("runRightDown")
			direction = "runRightDown"
		elif velocity.y < 0: 
			play("runRightUp")
			direction = "runRightUp"
		else: 
			play("runRight")
			direction = "runRight"
	elif velocity.x < 0: 
		if velocity.y > 0:
			play("runLeftDown")
			direction = "runLeftDown"
		elif velocity.y < 0: 
			play("runLeftUp")
			direction = "runLeftUp"
		else: 
			play("runLeft")
			direction = "runLeft"
	elif velocity.y > 0:
		play("runDown")
		direction = "runDown"
	elif velocity.y < 0: 
		play("runUp")
		direction = "runUp"
	else: 
		match direction:
			"runRightDown":
				play("idleRightDown")
			"runRightUp":
				play("idleRightUp")
			"runRight":
				play("idleRight")
			"runLeftDown":
				play("idleLeftDown")
			"runLeftUp":
				play("idleLeftUp")
			"runLeft":
				play("idleLeft")
			"runDown":
				play("idleDown")
			"runUp":
				play("idleUp")

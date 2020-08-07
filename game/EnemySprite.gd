extends AnimatedSprite

var direction = 'Right'

func move(motion):
	if motion.x > 0:
		if motion.y > 0:
			direction = 'RightDown'
		elif motion.y < 0:
			direction = 'RightUp'
		else:
			direction = 'Right'
	
	if motion.x != 0 && motion.y != 0:
		play('walk' + direction)
	if

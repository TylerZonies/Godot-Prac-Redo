extends RigidBody2D

const PROJECTILE_SPEED = 800
const LIFETIME = 0.8

func _ready():
	apply_impulse(Vector2(), Vector2(PROJECTILE_SPEED, 0).rotated(rotation))
	destroy()
	
func destroy():
	yield(get_tree().create_timer(LIFETIME), "timeout")
	queue_free()

func _on_projectile_body_entered(body):
	self.hide()


extends RigidBody2D

const PROJECTILE_SPEED = 800
export var lifeTime = 0.3

func _ready():
	apply_impulse(Vector2(), Vector2(PROJECTILE_SPEED, 0).rotated(rotation))
	destroy()
	
func destroy():
	yield(get_tree().create_timer(lifeTime), "timeout")
	queue_free()

func _on_projectile_body_entered(body):
	self.hide()


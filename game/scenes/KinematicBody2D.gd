extends KinematicBody2D

var speed = 400
var velocity = Vector2()
const MOVE = 1
signal movement
var rateOfFire = 0.2
var canFire = true

var projectile = preload("res://scenes/projectile.tscn")


func get_input(): 
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		velocity.x += MOVE
	if Input.is_action_pressed('left'):
		velocity.x -= MOVE
	if Input.is_action_pressed('down'):
		velocity.y += MOVE 
	if Input.is_action_pressed('up'):
		velocity.y -= MOVE
	velocity = velocity.normalized() * speed
	

func _process(delta):
	SkillLoop()
	
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	emit_signal("movement", velocity)
	

	
func SkillLoop():
	if Input.is_action_pressed("shoot") and canFire == true:
		canFire = false
		get_node("TurnAxis").rotation = get_angle_to(get_global_mouse_position())
		var projectileInstance = projectile.instance()
		projectileInstance.position = get_node("TurnAxis/CastPoint").get_global_position()
		projectileInstance.rotation = get_angle_to(get_global_mouse_position())
		get_parent().add_child(projectileInstance)
		yield(get_tree().create_timer(rateOfFire), "timeout")
		canFire = true







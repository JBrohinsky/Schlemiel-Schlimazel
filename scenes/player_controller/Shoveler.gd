extends RigidBody2D

signal shovel
var can_move := true
var nextposition := position.x

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#func _input(event):
	#if event is InputEventKey and event.pressed:
		#if event.keycode == KEY_SPACE and can_move:
			#shovel_next()
			#can_move = false


func shovel_next():
	# reset
	if can_move == false:
		reset()
	
	var direction = 1
	#print($"..".player_num)
	#if $"..".player_num == 2:
		#direction = -1
	nextposition += 60 * direction
	$AnimatedSprite2D.play("default")
	can_move = false
	shovel.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass

	#move_and_slide()
	#for index in get_slide_collision_count():
		#var collision = get_slide_collision(index)
		#print(collision)

func _process(delta):
	position.x = lerp(position.x, nextposition, 0.99 * delta)
	#position.y -= 1 * delta
	#if Input.is_action_pressed($"..".move_input) and can_move:
		#shovel_next()
		#can_move = false
	#print("velocity.x" + str(velocity.x))
	#if linear_velocity.x <= 11.5:
		#can_move = true
		#linear_velocity.x = 0

func reset():
	position.x = nextposition
	$AnimatedSprite2D.stop()
	$AnimatedSprite2D.frame = 0
	get_tree().call_group("driveway","handle_clear_snow")

func _on_animated_sprite_2d_animation_finished():
	print("animfinished")
	get_tree().call_group("driveway","handle_clear_snow")
	can_move = true # Replace with function body.



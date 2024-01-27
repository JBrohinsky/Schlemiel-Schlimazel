extends CharacterBody2D

#signal shovel
var can_move := true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#func _input(event):
	#if event is InputEventKey and event.pressed:
		#if event.keycode == KEY_SPACE and can_move:
			#shovel_next()
			#can_move = false
			
			

func shovel_next():
	var direction = 1
	print($"..".player_num)
	if $"..".player_num == 2:
		direction = -1

	velocity.x = 35 * direction
	$AnimatedSprite2D.play("default")
	#shovel.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity = lerp(velocity, Vector2(0,0), 0.95 * delta)
	move_and_slide()

func _process(_delta):
	if Input.is_action_pressed("space") and can_move:
		shovel_next()
		can_move = false

func _on_animated_sprite_2d_animation_finished():
	can_move = true # Replace with function body.

extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("backspace"):
		#linear_velocity.x = -50000 * delta
		#velocity.x = -500000 * delta
		#move_and_slide()
		add_constant_force(Vector2(-500000 * delta, 0))
		
#

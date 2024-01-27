extends RigidBody2D

signal shovel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_SPACE:
			position.x += 56
			$AnimatedSprite2D.play("default")
			shovel.emit()
			


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

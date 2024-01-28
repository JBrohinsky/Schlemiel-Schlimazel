extends Node2D

@export var buttonID : int

# Called when the node enters the scene tree for the first time.
func _ready():
	buttonID = get_index()
	print(get_index()) # Replace with function body.
	add_to_group("buttons")


func set_frame(button : int, frame : int):
	if button == buttonID:
		$AnimatedSprite2D.frame = frame

func pressed(button : int):
	if button == buttonID:
		$AnimatedSprite2D.frame = 13

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	


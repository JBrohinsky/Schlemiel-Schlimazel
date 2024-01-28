extends Node2D
@export var player_num : int = 0
@export var move_input := "space"

signal shovel_handler

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_shoveler_shovel():
	shovel_handler.emit() # Replace with function body.

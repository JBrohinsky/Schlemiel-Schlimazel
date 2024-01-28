extends TileMap

@export var tile := 2

var cleared := Vector2i(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func clear_snow(current_tile : Vector2i):
	set_cell(0, current_tile, 1, cleared)
	



#func _on_shoveler_shovel():
	#clear_snow(Vector2i(tile, 0)) # Replace with function body.
	#tile += 1


func handle_clear_snow():
	print("handlesnow")
	clear_snow(Vector2i(tile, 0)) # Replace with function body.
	tile += 1

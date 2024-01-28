extends Node2D

var buttons = {
 "xbox_a"     : 1  ,
 "xbox_b"     : 2  ,
 "xbox_x"     : 3  ,
 "xbox_y"     : 4  ,
 "xbox_right" : 5  ,
 "xbox_up"    : 6  ,
 "xbox_down"  : 7  ,
 "xbox_left"  : 8  ,
 "xbox_lb"     : 9  ,
 "xbox_rb"     : 10 ,
 "xbox_lt"     : 11 ,
 "xbox_rt"     : 12 
}

var inputs = []
var current_button := 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# get_tree().call_group("buttons","set_frame",2,6)

func next_qt_event():
	inputs.clear()
	for i in range(1,5):
		var input = get_random_input()
		inputs.append(input)
		var input_index = buttons[input]
		get_tree().call_group("buttons","set_frame",i,input_index)
		print(input)
		
	
func get_random_input():
	var size = buttons.size()
	var random_key = buttons.keys()[randi() % size]
	return random_key

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if inputs.size() > 0 and Input.is_action_just_pressed(inputs[current_button]):
		get_tree().call_group("buttons","pressed",current_button+1)
		print(inputs[current_button])
		current_button += 1
		current_button = current_button % 4
		print(current_button)
		if current_button == 0:
			get_tree().call_group("shoveler", "shovel_next")
			next_qt_event()



func _on_timer_timeout():
	next_qt_event() # Replace with function body.

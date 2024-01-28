extends Node2D

@export var points_to_win := 19
var points := 0

@onready var timer = $Timer
@onready var pb = $SnowplowComing

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	timer.wait_time = pb.value # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pb.value =  (1 - timer.time_left / timer.wait_time) * 100


func _on_timer_timeout():
	$QuickTime.hide()
	$SnowPlow/Snowplow.launch_snowplow() # Replace with function body.
	await get_tree().create_timer(3.0).timeout
	$ColorRect.show()


func _on_begin_button_pressed():
	$ColorRect.hide()# Replace with function body.
	$BeginButton.hide()
	$Timer.start()


func _on_player_shovel_handler():
	points += 1
	if points >= points_to_win:
		game_over()

func game_over():
	$Timer.stop()
	$ColorRect.show()

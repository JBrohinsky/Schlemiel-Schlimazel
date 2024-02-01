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
	if Input.is_action_pressed("xbox_start"):
		_on_begin_button_pressed()


func _on_timer_timeout():
	$Player_Controller.lerp = false
	$SnowplowComing.hide()
	$QuickTime.hide()
	$SnowPlow/Snowplow.launch_snowplow()
	await get_tree().create_timer(3.0).timeout
	$ColorRect.show()
	$Plowd.show()
	$RestartButton.show()


func _on_begin_button_pressed():
	$ColorRect.hide()
	$BeginButton.hide()
	$Timer.start()
	$Start.hide()
	$Plowd.hide()
	$QuickTime.show()
	$CheckButton.hide()
	$ImpossibleMode.hide()
	$ControllerChoice.hide()

func _on_player_shovel_handler():
	points += 1
	if points >= points_to_win:
		game_over()

func game_over():
	$Timer.stop()
	$SnowplowComing.hide()
	$QuickTime.hide()
	$ColorRect.show()
	$RestartButton.show()
	$Win.show()
	
func _on_restart_button_pressed():
	get_tree().reload_current_scene() 


func _on_check_button_toggled(toggled_on):
	if toggled_on:
		$Timer.wait_time = 10
	else:
		$Timer.wait_time = 40 


func _on_option_button_item_selected(index):
	$QuickTime.switch_controllers(index)
	$QuickTime.next_qt_event() # Replace with function body.

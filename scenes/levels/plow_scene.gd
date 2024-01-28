extends Node2D

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
	$SnowPlow/Snowplow.launch_snowplow() # Replace with function body.

extends Path3D

var drone1 = preload("res://drones/drone1.tscn")
var drone2 = preload("res://drones/drone2.tscn")

@export_flags("Drone1", "Drone2") var drone_types = 1
@export_range(0.1, 10) var speed: float = 1
@export var start_time: float = 0

var available_drones = []
var drone: RigidBody3D

# Called when the node enters the scene tree for the first time.
func _ready():
	$StartTimer.start(start_time)
	$PathFollow3D/AnimationPlayer.speed_scale = speed
	if drone_types & 1:
		available_drones.append(drone1)
	if drone_types & 2:
		available_drones.append(drone2)

func create_drone():
	var selected_drone = available_drones.pick_random()
	drone = selected_drone.instantiate()
	$PathFollow3D/AnimationPlayer.speed_scale *= drone.set_speed(speed) #omg... ugliest yet
	$PathFollow3D.add_child(drone)

func drone_reached_destination():
	drone.queue_free()
	if not drone.top_level:
		$destination.play()
		print("Drone reached its target")

func _on_start_timer_timeout():
	$PathFollow3D/AnimationPlayer.play("fly")

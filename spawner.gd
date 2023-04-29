extends Path3D

@export_flags("Drone1", "Drone2") var drone_types = 1
@export_range(0.5, 10) var speed = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	$PathFollow3D/AnimationPlayer.speed_scale = speed
	enable_drone()

func enable_drone():
	var available_drones = []
	if drone_types & 1:
		available_drones.append($PathFollow3D/Drone1)
	if drone_types & 2:
		available_drones.append($PathFollow3D/Drone2)
	
	available_drones.pick_random().visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_player_animation_finished(anim_name):
	enable_drone()

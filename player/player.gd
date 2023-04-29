extends Node3D

var net1 = preload("res://player/net.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.net_impulse = 40
	Globals.net_cooldown = 0.8
	Globals.net_scale = 1


func _input(event):
	if event is InputEventMouseMotion:
		var look_dir = event.relative * 0.1
		#rotation.y -= look_dir.x * Globals.mouse_sensitivity
		$pivot.rotation.y = clamp($pivot.rotation.y - look_dir.x * Globals.mouse_sensitivity, -1.5, 1.5)
		$pivot.rotation.x = clamp($pivot.rotation.x - look_dir.y * Globals.mouse_sensitivity, -1.5, 1.5)

	if event.is_action_pressed("shoot") and $NetCooldownTimer.time_left == 0:
		var net: RigidBody3D = net1.instantiate()
		net.apply_central_impulse($pivot.global_transform.basis.z * -Globals.net_impulse)
		net.set_net_scale(Globals.net_scale)
		add_sibling(net)
		net.global_transform.origin = $pivot/Camera3D/model.global_position
		net.global_rotation = $pivot/Camera3D.global_rotation
		$NetCooldownTimer.start(Globals.net_cooldown)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
